from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases import Disease
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

# class Symptoms(BaseModel):
#     disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
#     name = models.CharField(_("Name"), max_length=100)

#     def __str__(self) -> str:
#         return self.name

class Keyword(BaseModel):
    name = models.CharField(_("Name"), max_length=100)

    def __str__(self) -> str:
        return self.name

class News(BaseModel):
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE, blank=True, null=True)
    title = models.CharField(_("News Title"),max_length=200)
    content = RichTextField(_('News Content'))
    slug = models.SlugField(unique=True)
    author = models.ForeignKey(UserAccount, related_name='author', on_delete=models.CASCADE, blank=True, null=True)
    editor = models.ForeignKey(UserAccount, related_name='editor', on_delete=models.CASCADE, blank=True, null=True)
    keyword = models.ManyToManyField(Keyword, blank=True)
    visits = models.PositiveIntegerField(default=0)

    def __str__(self) -> str:
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "News"
        verbose_name_plural = 'News'