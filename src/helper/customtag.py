from django import template
from disease.models.news_model import *
from home.models import Carousel, Info

register = template.Library()

@register.filter(name='get_disease')
def get_disease(obj):
    return News.objects.all()


@register.filter(name='get_category')
def get_category(obj):
    return Category.objects.all()


@register.filter(name='get_info')
def get_info(obj):
    return Info.objects.all()

@register.filter(name='get_carousel')
def get_carousel(obj):
    return Carousel.objects.all()