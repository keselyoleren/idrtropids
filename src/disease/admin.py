from django.contrib import admin

from disease.models import *

# Register your models here.

@admin.register(Disease)
class DiseaseAdminView(admin.ModelAdmin):
    list_display = ['disease_name', 'disease_prevention', 'description', 'medicine', 'diagnose', 'lab_check', 'cause_of_disease']

@admin.register(News)
class NewsAdminView(admin.ModelAdmin):
    list_display = ['title', 'disease', 'author']

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("slug", )
        return super(NewsAdminView, self).get_form(request, obj, **kwargs)


@admin.register(Article)
class ArticleAdminView(admin.ModelAdmin):
    list_display = ['title', 'volume', 'publication', 'author']

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("slug", )
        return super(ArticleAdminView, self).get_form(request, obj, **kwargs)


@admin.register(Book)
class BookAdminView(admin.ModelAdmin):
    list_display = ['title', 'publisher', 'edition', 'issn']

    def get_form(self, request, obj=None, **kwargs):
        self.exclude = ("slug", )
        return super(BookAdminView, self).get_form(request, obj, **kwargs)


@admin.register(Keyword)
class KeywordAdminView(admin.ModelAdmin):
    list_display = ['name']