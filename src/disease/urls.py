from rest_framework import routers
from disease.apiviewset.article import ArticleApiView
from disease.apiviewset.book import BookApiView
from disease.apiviewset.category_views import CategoryApiView
from disease.apiviewset.diseases import DiseasesApiView
from disease.apiviewset.disqus.answer import AnswerApiView
from disease.apiviewset.disqus.question_diseases import QuestionDiseasesApiView
from disease.apiviewset.disqus.question_public import QuestionApiView
from disease.apiviewset.news import NewsApiView
from disease.apiviewset.report import ReportApiView
from disease.apiviewset.search import SearchApiView
from disease.views.article_views import ArticleCategoryView, ArticleDetailView, ArticleView
from disease.views.book_views import BookCategoryListView, BookDetailView, BookListView
from disease.views.diseases_views import  DiseasesDetailView, DiseasesListView

from disease.views.news_views import NewsCategoryListView, NewsDdetailView, NewsListView
from django.urls import path, include
from disease.views.question_views import QuestionCreateView, QuestionDiseasesAnswerDetailView, QuestionDiseasesCreateView, QuestionDiseasesListView

from disease.views.report_views import ReportCategoryListView, ReportDetailView, ReportListView
from disease.views.search_views import SearchView

route = routers.DefaultRouter()
route.register('news', NewsApiView)
route.register(r'diseases/(?P<diseases_id>\d+)/question', QuestionDiseasesApiView)
route.register('questions', QuestionApiView)
route.register(r'questions/(?P<question_id>\d+)/answer', AnswerApiView)
route.register('diseases', DiseasesApiView)
route.register('book', BookApiView)
route.register('report', ReportApiView)
route.register('article', ArticleApiView)
route.register('category', CategoryApiView)
route.register('search', SearchApiView, basename='api-serach')

page_urls = route.urls



urlpatterns = [
    path('diseases/', DiseasesListView.as_view(), name='diseases'),
    path('diseases/<slug:slug>/', DiseasesDetailView.as_view(), name='diseases-detail'),
    path('news/', include([
        path('', NewsListView.as_view(), name='news'),
        path('<slug:slug>/', NewsDdetailView.as_view(), name='detail-news'),
        path('category/<str:category>//', NewsCategoryListView.as_view(), name='berita-category'),
    ])),
    
    path('book/', include([
        path('', BookListView.as_view(), name='book'),
        path('category/<str:category>/',BookCategoryListView.as_view(), name="buku-category"),
        path('<slug:slug>/', BookDetailView.as_view(), name='detail-book'),
    ])),
    
    path('article/', include([
        path('', ArticleView.as_view(), name='article'),
        path('category/<str:category>/', ArticleCategoryView.as_view(), name='article-category'),
        path('<slug:slug>/', ArticleDetailView.as_view(), name='detail-article'),
    ])),
    
    path('report/', include([
        path('', ReportListView.as_view(), name='report'),
        path('<slug:slug>/', ReportDetailView.as_view(), name='detail-report'),
        path('category/<str:category>/', ReportCategoryListView.as_view(), name='report-category'),
    ])),
    
    path('disqus/', include([
        path('question/create/', QuestionCreateView.as_view(), name='create_diseases'),
        path('question/list/<str:diseases>/', QuestionDiseasesListView.as_view(), name='list_question_diseases'),
        path('question/<int:pk>/answer/', QuestionDiseasesAnswerDetailView.as_view(), name='answer_question_diseases'),
        path('question/<str:diseases>/', QuestionDiseasesCreateView.as_view(), name='create_question_diseases'),
    ])),
    
    path('search', SearchView.as_view(), name='search')

]
