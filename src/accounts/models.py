# from django.db import models

# # Create your models here.

# from django.contrib.auth.models import AbstractUser, AbstractBaseUser
# from django.utils.translation import gettext as _
# from django.db import models

# # Create your models here.
# class UserAccount(AbstractBaseUser):
#     TYPE = [
#         (None, '----'),
#         ('admin', 'admin'),
#         ('researcher', 'researcher'),
#         ('practitioner', 'practitioner'),
#         ('editor', 'editor'),
#         ('visitor', 'visitor'),
#     ]
#     role = models.CharField(_("Role"), max_length=50,  choices=TYPE, default='visitor')

#     class Meta:
#         verbose_name = _("User Account")
#         verbose_name_plural = _("User Account")
    
    