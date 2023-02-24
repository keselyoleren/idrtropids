from helper.form import AbstractForm
from disease.models.references import Article

class ArticleForm(AbstractForm):
    class Meta:
        model = Article
        fields = "__all__"