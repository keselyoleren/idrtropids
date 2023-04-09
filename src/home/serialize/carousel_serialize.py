from pyexpat import model
from rest_framework import serializers
from ..models import Carousel

class CarouselSerialize(serializers.ModelSerializer):
    class Meta:
        model = Carousel
        fields = "__all__"

        