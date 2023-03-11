from django.db import models
from django.utils.translation import gettext_lazy as _
from config.models import BaseModel
from users.models import UserAccount
from django.utils.text import slugify
from ckeditor.fields import RichTextField

# Create your models here.
class Category(BaseModel):
    parent = models.ForeignKey(
        'self', on_delete=models.CASCADE, blank=True, null=True
    )
    name = models.CharField(_("Category Name"), max_length=100)

    def __str__(self) -> str:
        return self.name

    class Meta:
        verbose_name = _("Category")
        verbose_name_plural = 'Category'

class Disease(BaseModel):
    author = models.ForeignKey(UserAccount, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, blank=True, null=True)
    slug = models.CharField(unique=True, max_length=255)
    disease_name = models.CharField(_("Disease Name"),max_length=255)
    disease_prevention = models.TextField("Disease Prevention")
    description = models.TextField(_("Description"))
    medicine = models.TextField(_('Medicine'))
    diagnose = models.TextField(_("Diagnose"))
    lab_check = models.TextField(_("Lab Check"))
    cause_of_disease = models.CharField(_("Caouse of disease"), max_length=255)
    content = RichTextField(_('content'))
    visits = models.PositiveIntegerField(default=0)


    def __str__(self) -> str:
        return self.disease_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.disease_name)
        return super().save(*args, **kwargs)
    
    class Meta:
        verbose_name = "Disease"
        verbose_name_plural = 'Disease'
        
        