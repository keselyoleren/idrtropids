from helper.form import AbstractForm
from disease.models.news_model import News

class NewsForm(AbstractForm):
    class Meta:
        model = News
        fields = "__all__"