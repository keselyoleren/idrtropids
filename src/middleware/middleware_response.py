# ----------------------------------
# middleware.py
# ----------------------------------

import contextlib
import json
import copy

from django.utils.deprecation import MiddlewareMixin
from django.utils.translation import ugettext_lazy as _
from django.core.serializers.json import DjangoJSONEncoder

from rest_framework import status


class BaseAPIResponseMiddleware(MiddlewareMixin):

    def render_response(self, response):
        default_response_keys = ('status', 'status_http', 'detail', 'message',
                                 'success', 'non_field_errors', 'count',
                                 'page_size', 'current_page', 'next',
                                 'previous', 'result', 'results', "data")

        key = 'data' if response.status_code == 200 else 'errors'
        response_data = copy.deepcopy({key:response.data})
        
        # setup default message into response data
        if 'message' not in response_data:
            response_data['message'] = None

        # store the status_code into response data
        if 'status' not in response_data:
            response_data['status'] = response.status_code

        # store the status_http into response data
        if 'status_http' not in response_data:
            response_data['status_http'] = response.status_code

        # updating the response message
        if 'detail' in response_data:
            response_data['message'] = response_data.get('detail')
            del response_data['detail']

        elif 'non_field_errors' in response_data:
            response_errors = '<br />'.join(response_data.get('non_field_errors'))
            response_data['message'] = response_errors
            del response_data['non_field_errors']

        # store the success boolean into response data
        if response.status_code >= 500:
            if not response_data.get('message'):
                response_data['message'] = _('Internat server error.')

            response_data |= {"success": False, "status_http": response.status_code}


        elif response.status_code >= 400:
            response_errors = []
            response_errors_keys = []

            if len(response_errors) > 0:
                response_errors = '<br />'.join(response_errors)
                response_data.update({'message': response_errors})

            if len(response_errors_keys) > 0:
                list(map(response_data.pop, response_errors_keys))

            if not response_data.get('message'):
                response_data.update({'message': _('Failed')})

            response_data.update({'success': False,
                                  'status_http': response.status_code})

        elif response.status_code >= 100:
            if not response_data.get('message'):
                response_data['message'] = _('Success')

            if 'success' not in response_data:
                response_data['success'] = True


        return response_data


    def process_response(self, request, response):
        if request.META['PATH_INFO'] == '/redoc/':
            return response
        
        if hasattr(response, 'data') and isinstance(response.data, dict):
            with contextlib.suppress(Exception):
                response_data = self.render_response(response)
                response.status_code = response_data.get('status_http')
                if 'status_http' in response_data:
                    del response_data['status_http']

                response.data = response_data
                response.content = json.dumps(response_data, cls=DjangoJSONEncoder)
        return response
    