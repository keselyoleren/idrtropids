from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext as _

from users.models import Profile, UserAccount


# Register your models here.
@admin.register(UserAccount)
class UserAdmin(BaseUserAdmin):
    list_display = ('username','email','role', 'is_superuser')
    fieldsets = (
        (None, {'fields': ('username', 'password', 'role')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (_('Permissions'), {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions'),
        }),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'role'),
        }),
    )

@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):
    list_display = ['full_name', 'gender', 'profesi', 'role', 'status_verified']
    fieldsets = (
        (None, {'fields': ('user','profile_pic','full_name', 'gender', 'profesi', 'tempat_lahir', 'deskirpsi', 'tgl_lahir',  'alamat', 'role', 'status_verified')}),
        (_('Researcher'), {'fields': ('scholar', 'sinta', 'scopus', 'orcid', 'affiliation', 'expertise', 'researcher_institute')}),
        (_('Practitioner'), {
            'fields': ('office_name', 'office_address', 'doctor_id'),
        }),
    )