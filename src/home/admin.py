from django.contrib import admin
from .models import Carousel, Info
# Register your models here.


@admin.register(Carousel)
class CarouselAdminView(admin.ModelAdmin):
    list_display = ['title', 'content']

@admin.register(Info)
class InfoAdminView(admin.ModelAdmin):
    list_display = ['title']