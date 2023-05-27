import contextlib
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases_model import Disease
from helper.choices import StatusChoice
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

class Question(BaseModel):
    diseases = models.ForeignKey(Disease, on_delete=models.CASCADE, blank=True, null=True)
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name="question_parent", blank=True, null=True)
    user = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    title = models.CharField(_('Judul Pertanyaan'), max_length=255, blank=True, null=True)
    asign_to = models.ManyToManyField(UserAccount, related_name="asign_to", blank=True, help_text="Pertanyaan ini ditujukan kepada.")
    question = models.TextField(_('Konten Pertanyaan'))
    is_validate = models.BooleanField(default=False)
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)

    def __str__(self) -> str:
        with contextlib.suppress(Exception):
            return self.title
    
    class Meta:
        verbose_name = 'Question'
        verbose_name_plural = "Question"


class Answer(BaseModel):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, blank=True, null=True)
    author = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    answer = RichTextField()

    def __str__(self) -> str:
        return self.question.title
    
    class Meta:
        verbose_name = 'Answer'
        verbose_name_plural = "Answer"

