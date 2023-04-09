import contextlib
from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from helper.choices import StatusChoice
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField
from PIL import Image

# Create your models here.
class Category(BaseModel):
    name = models.CharField(_("Category Name"), max_length=100)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = 'Category'

class Disease(BaseModel):
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    thumbnail = models.ImageField(upload_to="thumbnail/", default='thumbnail/default-thumbnail.png')
    created_by = models.ForeignKey(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    slug = models.CharField(unique=True, max_length=255, blank=True, null=True)
    disease_name = models.CharField(_("Disease Name"),max_length=255)
    disease_prevention = models.TextField("Disease Prevention", blank=True, null=True)
    description = models.TextField(_("Description"), blank=True, null=True)
    medicine = models.TextField(_('Medicine'), blank=True, null=True)
    symtomps = models.TextField(_('Symtoms'), blank=True, null=True)
    diagnose = models.TextField(_("Diagnose"), blank=True, null=True)
    lab_check = models.TextField(_("Lab Check"), blank=True, null=True)
    cause_of_disease = models.TextField(_("Caouse of disease"), blank=True, null=True)
    content = RichTextField(_('content'))
    status = models.CharField(_("Status"), max_length=100,  choices=StatusChoice.choices, default=StatusChoice.PENDING, blank=True, null=True)
    visits = models.PositiveIntegerField(default=0, blank=True, null=True)


    def __str__(self) -> str:
        return self.disease_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.disease_name)
        super().save(*args, **kwargs)
        with contextlib.suppress(Exception):
            img = Image.open(self.thumbnail.path)
            if img.width > 800:
                new_size = (800, 800)
                img.thumbnail(new_size)
                img.save(self.thumbnail.path)

    
    class Meta:
        verbose_name = "Disease"
        verbose_name_plural = 'Disease'
        
        