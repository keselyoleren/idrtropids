from rest_framework import routers
from disease.apiviewset.article import ArticleApiView
from disease.apiviewset.book import BookApiView
from disease.apiviewset.diseases import DiseasesApiView
from disease.apiviewset.disqus.question import QuestionDiseasesApiView
from disease.apiviewset.news import NewsApiView
from disease.apiviewset.report import ReportApiView
from disease.apiviewset.search import SearchApiView
from disease.views.article_views import ArticleDetailView, ArticleView
from disease.views.book_views import BookDetailView, BookListView
from disease.views.diseases_views import  DiseasesDetailView, DiseasesListView

from disease.views.news_views import NewsDdetailView, NewsListView
from django.urls import path, include
from disease.views.question_views import QuestionCreateView, QuestionDiseasesAnswerDetailView, QuestionDiseasesCreateView, QuestionDiseasesListView

from disease.views.report_views import ReportDetailView, ReportListView
from disease.views.search_views import SearchView

route = routers.DefaultRouter()
route.register('news', NewsApiView)
route.register(r'diseases/(?P<diseases_id>\d+)/question', QuestionDiseasesApiView)
route.register('diseases', DiseasesApiView)
route.register('book', BookApiView)
route.register('report', ReportApiView)
route.register('article', ArticleApiView)
route.register('search', SearchApiView, basename='api-serach')

page_urls = route.urls



urlpatterns = [
    path('diseases/', DiseasesListView.as_view(), name='diseases'),
    path('diseases/<slug:slug>/', DiseasesDetailView.as_view(), name='diseases-detail'),
    path('news/', NewsListView.as_view(), name='news'),
    path('news/<slug:slug>/', NewsDdetailView.as_view(), name='detail-news'),
    path('book', BookListView.as_view(), name='book'),
    path('book/<slug:slug>/', BookDetailView.as_view(), name='detail-book'),
    path('article', ArticleView.as_view(), name='article'),
    path('article/<slug:slug>/', ArticleDetailView.as_view(), name='detail-article'),
    path('report/', ReportListView.as_view(), name='report'),
    path('report/<slug:slug>/', ReportDetailView.as_view(), name='detail-report'),
    path('disqus/question/<str:diseases>/', QuestionDiseasesCreateView.as_view(), name='create_question_diseases'),
    path('disqus/question/', QuestionCreateView.as_view(), name='create_diseases'),
    path('disqus/question/list/<str:diseases>/', QuestionDiseasesListView.as_view(), name='list_question_diseases'),
    path('disqus/question/<int:pk>/answer/', QuestionDiseasesAnswerDetailView.as_view(), name='answer_question_diseases'),
    path('search', SearchView.as_view(), name='search')

]
