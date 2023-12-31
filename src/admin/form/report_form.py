from helper.form import AbstractForm
from disease.models.references_model import Book, Report

class ReportForm(AbstractForm):
    class Meta:
        model = Report
        fields = "__all__"