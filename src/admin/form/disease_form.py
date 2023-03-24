from disease.models.diseases_model import Disease
from helper.form import AbstractForm
from disease.models.references_model import Book, Report

class DiseaseForm(AbstractForm):
    class Meta:
        model = Disease
        fields = "__all__"