import contextlib
from django.db import models

# Create your models here.

from django.contrib.auth.models import AbstractUser, AbstractBaseUser
from django.utils.translation import gettext as _
from django.db import models
from ckeditor.fields import RichTextField

from helper.choices import GenderChoice, RoleChoice, StatusVerified

from PIL import Image
from io import BytesIO
from django.core.files.base import ContentFile
import os
import uuid

# Create your models here.
TYPE = [
        (None, '----'),
        ('admin', 'admin'),
        ('researcher', 'researcher'),
        ('practitioner', 'practitioner'),
        ('editor', 'editor'),
        ('visitor', 'visitor'),
    ]
class UserAccount(AbstractUser):
    role = models.CharField(_("Role"), max_length=50,  choices=TYPE, default='visitor')

    class Meta:
        verbose_name = _("User Account")
        verbose_name_plural = _("User Account")
    
    

class Profile(models.Model):
    user = models.OneToOneField(UserAccount, on_delete=models.CASCADE, blank=True, null=True)
    profile_pic = models.ImageField(_("Profile Picture"), upload_to="profile_pic")
    profile_url = models.CharField(_("Profile Url"), max_length=255, blank=True, null=True)
    full_name = models.CharField(_("Nama Lengkap"), max_length=100, blank=True, null=True)
    gender = models.CharField(_("Jenis Kelamin"), choices=GenderChoice.choices, default=GenderChoice.LAKI_LAKI, max_length=15)
    tempat_lahir = models.CharField(_("Tempat Lahir"), max_length=100, blank=True, null=True)
    tgl_lahir = models.DateField(_("Tanggal Lahir"), blank=True, null=True)
    alamat = models.CharField(_("Alamat"), max_length=255, blank=True, null=True)
    profesi = models.CharField(_("Profesi"), max_length=255, blank=True, null=True)
    deskirpsi = RichTextField(_("Deskripsi"), blank=True, null=True)
    role = models.CharField(_("Role"), max_length=50,  choices=RoleChoice.choices, blank=True, null=True)
    
    # researcher
    scholar = models.CharField(_("Scholar"), max_length=255, blank=True, null=True)
    sinta = models.CharField(_("Sinta"), max_length=255, blank=True, null=True)
    scopus = models.CharField(_("Scopus"), max_length=255, blank=True, null=True)
    orcid = models.CharField(_("Orcid"), max_length=255, blank=True, null=True)
    affiliation = models.CharField(_("Affiliation"), max_length=255, blank=True, null=True)
    expertise = models.CharField(_("Expertise"), max_length=255, blank=True, null=True)
    researcher_institute = models.CharField(_("Research Institude"), max_length=255, blank=True, null=True)

    # practitioner
    office_name = models.CharField(_("Nama Kantor / Instansi"), max_length=255, blank=True, null=True)
    office_address = models.CharField(_("Alamat Kantor / Instansi"), max_length=255, blank=True, null=True)
    doctor_id = models.CharField(_("Nomor ID Doktor"), max_length=255, blank=True, null=True)
    status_verified = models.CharField(_("Status Verified"), max_length=50, choices=StatusVerified.choices, blank=True, null=True)
    
    
    def save(self, *args, **kwargs):
        with contextlib.suppress(Exception):
            self.make_thumbnail(self.profile_pic)
            self.profile_url = self.profile_pic.path
        return super().save(*args, **kwargs)

    def make_thumbnail(self, img):
        image = Image.open(img)
        new_h = 300
        new_w = image.width*new_h/image.height
        image.thumbnail((new_w, new_h), Image.ANTIALIAS)

        thumb_name, thumb_extension = os.path.splitext(self.file.name)
        thumb_extension = thumb_extension.lower()
        # thumb_filename = thumb_name + '_thumb' + thumb_extension
        thumb_filename = f"{thumb_name}_{str(uuid.uuid4())[:8]}_thumb{thumb_extension}"

        if thumb_extension in ['.jpg', '.jpeg']:
            FTYPE = 'JPEG'
        elif thumb_extension == '.gif':
            FTYPE = 'GIF'
        elif thumb_extension in ['.png', '.tif']:
            FTYPE = 'PNG'
        else:
            return False    # Unrecognized file type

        # Save thumbnail to in-memory file as StringIO
        temp_thumb = BytesIO()
        image.save(temp_thumb, FTYPE)

        if new_w >= 600:
            image.crop((0, 0, new_h, 600))
        elif new_h >= 300:
            image.crop((0, 0, 300, new_h))

        temp_thumb.seek(0)
        # set save=False, otherwise it will run in an infinite loop
        self.thumbnail.save(thumb_filename, ContentFile(
            temp_thumb.read()), save=False)
        temp_thumb.close()
        return True
    
    class Meta:
        verbose_name = _("User Profile")
        verbose_name_plural = _("User Profile")