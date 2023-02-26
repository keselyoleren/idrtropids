from django.db import models
from django.utils.translation import gettext_lazy as _

class StatusChoice(models.TextChoices):
    PENDING = 'Pending', _('Menunggu Verifikasi')
    APROVED = 'Aproved', _('Aproved')
    REVISI = 'Revisi', _('Perlu di revisi')
    RIJECT = 'Ditolak', _('Ditolak')

class GenderChoice(models.TextChoices):
    LAKI_LAKI = "Laki Laki"
    PEREMPUAN = "Perempuan"


class StatusVerified(models.TextChoices):
    VERIFIED = 'Verified'
    WAITING = 'Waiting'