from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases import Disease
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

class Question(BaseModel):
    diseases = models.ForeignKey(Disease, on_delete=models.CASCADE, blank=True, null=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name="question_parent", blank=True, null=True)
    user = models.ForeignKey(UserAccount, on_delete=models.CASCADE)
    title = models.CharField(_('Judul Pertanyaan'), max_length=255, blank=True, null=True)
    question = RichTextField(_('Konten Pertanyaan'))
    is_validate = models.BooleanField(default=False)

    def __str__(self) -> str:
        return self.title
    
    class Meta:
        verbose_name = 'Question'
        verbose_name_plural = "Question"


class Answer(BaseModel):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    author = models.ForeignKey(UserAccount, on_delete=models.CASCADE)
    answer = RichTextField()

    def __str__(self) -> str:
        return self.question.title
    
    class Meta:
        verbose_name = 'Answer'
        verbose_name_plural = "Answer"

