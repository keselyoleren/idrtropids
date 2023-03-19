from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.utils.urls import remove_query_param, replace_query_param
from django.core.paginator import Paginator

class ResponsePagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'limit'
    max_page_size = 100

    def get_paginated_response(self, data):
        return Response({
            'meta': {
                'current_page': self.page.number,
                'next_page': self.get_next_link(),
                'previous_page': self.get_previous_link(),
                'count': self.page.paginator.count,
            },
            'results': data,
        })

    def paginate_no_queryset(self, data, view=None):
        paginator = Paginator(data, self.page_size)
        self.page = self.request.query_params.get('page', 1)
        page = paginator.page(self.page)
        # print(list(paginator.object_list))
        return page.object_list


    
    def custom_get_next_link(self):
        url = self.request.build_absolute_uri()
        page_number = int(self.page) + 1
        return replace_query_param(url, self.page_query_param, page_number)

    def custom_get_previous_link(self):
        url = self.request.build_absolute_uri()
        page_number = int(self.page) - 1
        if page_number == 1:
            return remove_query_param(url, self.page_query_param)
        return replace_query_param(url, self.page_query_param, page_number)


    def get_paginated_response_without_queryset(self, data):
        try:
            return Response({
                'meta': {
                    'current_page': int(self.page),
                    'next_page': self.custom_get_next_link(),
                    'previous_page': None if int(self.page) <= 1 else self.custom_get_previous_link(),
                    'count': len(data),
                },
                'results': data,
            })
        except Exception:
            return Response({"detail": "Not found."}, status=404)