from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from disease.models.diseases import Disease
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

class Article(BaseModel):
    title = models.CharField(_("Title"),max_length=200)
    slug = models.SlugField(unique=True)
    abstract = RichTextField(_("Abstract"))
    volume = models.CharField(_("Volume"), max_length=100)
    pages_article = models.CharField(_("Pages Article"), max_length=100)
    publication = models.CharField(_("Publication"), max_length=100)
    issue = models.CharField(_("Issue"), max_length=100)
    isbn = models.CharField(_("Isbn"), max_length=100)
    issn = models.CharField(_("Issn"), max_length=100)
    doi = models.CharField(_("Doi"), max_length=100)
    author = models.CharField(_("Author"), max_length=100)
    url = models.URLField()


    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "Article"
        verbose_name_plural = 'Article'

class Book(BaseModel):
    title = models.CharField(_("Title"),max_length=200)
    slug = models.SlugField(unique=True)
    year_publish = models.DateField()
    pages = models.CharField(_("Pages"), max_length=100)
    publisher = models.CharField(_("Publisher"), max_length=100)
    edition = models.CharField(_("Edition"), max_length=100)
    author = models.CharField(_("Author"), max_length=100)
    publication = models.CharField(_("Publication"), max_length=100)
    url = models.URLField()
    issn = models.CharField(_("Issn"), max_length=100)
    abstract = RichTextField(_("Abstract"))
    

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "Book"
        verbose_name_plural = 'Book'
