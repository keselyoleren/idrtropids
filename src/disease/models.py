from ast import keyword
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

# Create your models here.
class Disease(BaseModel):
    disease_name = models.CharField(_("Disease Name"),max_length=255)
    disease_prevention = models.TextField("Disease Prevention")
    description = models.TextField(_("Description"))
    medicine = models.TextField(_('Medicine'))
    diagnose = models.TextField(_("Diagnose"))
    lab_check = models.TextField(_("Lab Check"))
    cause_of_disease = models.CharField(_("Caouse of disease"), max_length=255)

    def __str__(self) -> str:
        return self.disease_name

    class Meta:
        verbose_name = "Disease"

class Symptoms(BaseModel):
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE)
    name = models.CharField(_("Name"), max_length=100)

    def __str__(self) -> str:
        return self.name

class News(BaseModel):
    title = models.CharField(_("News Title"),max_length=200)
    content = RichTextField(_('News Content'))
    slug = models.SlugField(unique=True)
    author = models.ForeignKey(UserAccount, related_name='author', on_delete=models.CASCADE, blank=True, null=True)
    disease = models.ForeignKey(Disease, on_delete=models.CASCADE, blank=True, null=True)
    editor = models.ForeignKey(UserAccount, related_name='editor', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self) -> str:
        return self.title

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "News"

class Keyword(BaseModel):
    name = models.CharField(_("Name"), max_length=100)

    def __str__(self) -> str:
        return self.name

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
    keyword = models.ManyToManyField(Keyword)

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "Article"

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
    keyword = models.ManyToManyField(Keyword)
    

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "Book"
