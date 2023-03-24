import contextlib
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases_model import Disease
from helper.choices import StatusChoice
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField
from PIL import Image

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
    # disease = models.ForeignKey(Disease, on_delete=models.CASCADE, blank=True, null=True)
    thumbnail = models.ImageField(upload_to="thumbnail/", default='thumbnail/default-thumbnail.png')
    title = models.CharField(_("News Title"),max_length=200)
    content = RichTextField(_('News Content'))
    slug = models.CharField(unique=True, max_length=255, blank=True, null=True)
    created_by = models.ForeignKey(UserAccount, related_name='author', on_delete=models.CASCADE, blank=True, null=True)
    editor = models.ForeignKey(UserAccount, related_name='editor', on_delete=models.CASCADE, blank=True, null=True)
    keyword = models.ManyToManyField(Keyword, blank=True)
    visits = models.PositiveIntegerField(default=0, blank=True, null=True)
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)

    def __str__(self) -> str:
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super().save(*args, **kwargs)
        with contextlib.suppress(Exception):
            img = Image.open(self.thumbnail.path)
            if img.width > 800:
                new_size = (800, 800)
                img.thumbnail(new_size)
                img.save(self.thumbnail.path)

    
    class Meta:
        verbose_name = "News"
        verbose_name_plural = 'News'