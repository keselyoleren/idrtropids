from django.db import models
from django.utils.translation import gettext_lazy as _

# Create your models here.
class Carousel(models.Model):
    title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
    content = models.TextField(_("Content"), blank=True, null=True)
    image = models.ImageField(upload_to="image/", default='image/default-thumbnail.png', blank=True, null=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        verbose_name = "Carousel"
    