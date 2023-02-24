from helper.form import AbstractForm
from disease.models.references import Book
from django import forms

class BookForm(AbstractForm):
    class Meta:
        model = Book
        fields = "__all__"

    