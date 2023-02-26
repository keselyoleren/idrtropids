from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Profile, UserAccount


@receiver(post_save, sender=UserAccount)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance, full_name=instance.username)