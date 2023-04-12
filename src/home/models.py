from django.db import models
from django.utils.translation import gettext_lazy as _
from django.utils.text import slugify
from ckeditor.fields import RichTextField

# Create your models here.
class Carousel(models.Model):
    title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
    content = models.TextField(_("Content"), blank=True, null=True)
    image = models.ImageField(upload_to="image/", default='image/default-thumbnail.png', blank=True, null=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        verbose_name = "Carousel"
    

class Info(models.Model):
    title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
    slug = models.SlugField(unique=True, max_length=255, blank=True, null=True, help_text="Ini dikosongin aja")
    content = RichTextField()

    def save(self, *args, **kwargs):
        self.slug = slugify(self.title)
        super().save(*args, **kwargs)

    class Meta:
        verbose_name = "Informasi Web"



    