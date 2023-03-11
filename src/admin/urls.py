
from django.urls import path, include
from admin.views.book_views import *
from admin.views.diseases_views import *
from admin.views.report_views import *
from admin.views.news_views import *
from admin.views.article_views import *

urlpatterns = [
    path("books/", ListBook.as_view(), name="contributor_list_book"),
    path("book/add/", CreateBook.as_view(), name="contributor_add_book"),
    path("book/<int:pk>/edit/", UpdateBook.as_view(), name="contributor_update_book"),
    path("book/<int:pk>/delete/", DeleteBook.as_view(), name="contributor_delete_book"),

    path("reports/", ListReport.as_view(), name="contributor_list_report"),
    path("report/add/", CreateReport.as_view(), name="contributor_add_report"),
    path("report/<int:pk>/edit/", UpdateReport.as_view(), name="contributor_update_report"),
    path("report/<int:pk>/delete/", DeleteReport.as_view(), name="contributor_delete_report"),

    path("news/", ListNews.as_view(), name="contributor_list_news"),
    path("news/add/", CreateNews.as_view(), name="contributor_add_news"),
    path("news/<int:pk>/edit/", UpdateNews.as_view(), name="contributor_update_news"),
    path("news/<int:pk>/delete/", DeleteNews.as_view(), name="contributor_delete_news"),

    path("article/", ListArticle.as_view(), name="contributor_list_article"),
    path("article/add/", CreateArticle.as_view(), name="contributor_add_article"),
    path("article/<int:pk>/edit/", UpdateArticle.as_view(), name="contributor_update_article"),
    path("article/<int:pk>/delete/", DeleteArticle.as_view(), name="contributor_delete_article"),

    path("diseases/", ListDiseases.as_view(), name="contributor_list_diseases"),
    path("diseases/add/", CreateDiseases.as_view(), name="contributor_add_diseases"),
    path("diseases/<int:pk>/edit/", UpdateDiseases.as_view(), name="contributor_update_diseases"),
    path("diseases/<int:pk>/delete/", DeleteDiseases.as_view(), name="contributor_delete_diseases"),
]
