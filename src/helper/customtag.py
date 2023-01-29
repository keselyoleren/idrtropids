from disease.models import Disease, News
from django import template

register = template.Library()

@register.filter(name='get_disease')
def get_disease(obj):
    return News.objects.all()