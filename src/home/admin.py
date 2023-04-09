from django.contrib import admin
from .models import Carousel
# Register your models here.
@admin.register(Carousel)
class CarouselAdminView(admin.ModelAdmin):
    list_display = ['title', 'content']