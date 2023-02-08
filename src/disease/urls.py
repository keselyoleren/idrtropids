from rest_framework import routers
from disease.views.article import ArticleDetailView, ArticleView
from disease.views.book import BookDetailView, BookListView
from disease.views.diseases import DiseasesApiView

from disease.views.news import NewsApiView, NewsDdetailView, NewsListView
from django.urls import path, include

from disease.views.report import ReportDetailView, ReportListView

route = routers.DefaultRouter()
route.register('news', NewsApiView)
route.register('diseases', DiseasesApiView)

urlpatterns = [
    path('news/', NewsListView.as_view(), name='news'),
    path('news/<slug:slug>/', NewsDdetailView.as_view(), name='detail-news'),
    path('book', BookListView.as_view(), name='book'),
    path('book/<slug:slug>/', BookDetailView.as_view(), name='detail-book'),
    path('article', ArticleView.as_view(), name='article'),
    path('article/<slug:slug>/', ArticleDetailView.as_view(), name='detail-article'),
    path('report/', ReportListView.as_view(), name='report'),
    path('report/<slug:slug>/', ReportDetailView.as_view(), name='detail-report'),
]
