import contextlib
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases_model import Disease
from disease.models.news_model import Keyword
from helper.choices import StatusChoice
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField
from PIL import Image
from django.conf import settings


class Article(BaseModel):
    thumbnail = models.ImageField(upload_to="thumbnail/", default='thumbnail/default-thumbnail.png')
    title = models.CharField(_("Title"),max_length=200)
    slug = models.CharField(unique=True, max_length=255, blank=True, null=True)
    abstract = RichTextField(_("Abstract"))
    volume = models.CharField(_("Volume"), max_length=100, blank=True, null=True)
    pages_article = models.CharField(_("Pages Article"), max_length=100, blank=True, null=True)
    publication = models.CharField(_("Publication"), max_length=100, blank=True, null=True)
    issue = models.CharField(_("Issue"), max_length=100, blank=True, null=True)
    isbn = models.CharField(_("Isbn"), max_length=100, blank=True, null=True)
    issn = models.CharField(_("Issn"), max_length=100, blank=True, null=True)
    doi = models.CharField(_("Doi"), max_length=100, blank=True, null=True)
    author = models.CharField(_("Author"), max_length=100, blank=True, null=True)
    url = models.URLField()
    created_by = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    visits = models.PositiveIntegerField(default=0, blank=True, null=True)
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)


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
        verbose_name = "Article"
        verbose_name_plural = 'Article'

class Book(BaseModel):
    thumbnail = models.ImageField(upload_to="thumbnail/", default='thumbnail/default-thumbnail.png')
    title = models.CharField(_("Title"),max_length=200)
    slug = models.CharField(unique=True, max_length=255, blank=True, null=True)
    year_publish = models.DateField(blank=True, null=True)
    pages = models.CharField(_("Pages"), max_length=100, blank=True, null=True)
    publisher = models.CharField(_("Publisher"), max_length=100, blank=True, null=True)
    edition = models.CharField(_("Edition"), max_length=100, blank=True, null=True)
    author = models.CharField(_("Author"), max_length=100, blank=True, null=True)
    publication = models.CharField(_("Publication"), max_length=100, blank=True, null=True)
    url = models.URLField(blank=True, null=True)
    issn = models.CharField(_("Issn"), max_length=100, blank=True, null=True)
    abstract = RichTextField(_("Abstract"), blank=True, null=True)
    created_by = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    visits = models.PositiveIntegerField(default=0, blank=True, null=True)
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)
    

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
        verbose_name = "Book"
        verbose_name_plural = 'Book'

class Report(BaseModel):
    thumbnail = models.ImageField(upload_to="thumbnail/", default='thumbnail/default-thumbnail.png')
    title = models.CharField(_("Report Title"), max_length=200)
    abstract = RichTextField(_("Abstract"), blank=True, null=True)
    content = RichTextField(_("Content Report"), blank=True, null=True)
    slug = models.CharField(unique=True, max_length=255, blank=True, null=True)
    institution = models.CharField(_("Report institution"), max_length=200, blank=True, null=True)
    publisher = models.CharField(_("Report Publisher"), max_length=100, blank=True, null=True)
    author = models.CharField(_("Author"), max_length=100, blank=True, null=True)
    type = models.CharField(_('Report Type'), max_length=255, blank=True, null=True)
    date = models.DateTimeField(_('Report date'), blank=True, null=True)
    url = models.URLField(blank=True, null=True)
    city = models.CharField(_('Report City'), max_length=255, blank=True, null=True)
    keyword = models.ManyToManyField(Keyword, blank=True)
    created_by = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    visits = models.PositiveIntegerField(default=0, blank=True, null=True)
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)

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
        verbose_name = "Report"
        verbose_name_plural = 'Report'
