from django import template
from disease.models.news_model import *

register = template.Library()

@register.filter(name='get_disease')
def get_disease(obj):
    return News.objects.all()