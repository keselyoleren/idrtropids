from disease.models.diseases import Disease
from helper.form import AbstractForm
from disease.models.references import Book, Report

class DiseaseForm(AbstractForm):
    class Meta:
        model = Disease
        fields = "__all__"