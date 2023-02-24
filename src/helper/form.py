from django import forms
from django.contrib.admin.widgets import (
    AdminDateWidget,
)

class AbstractForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AbstractForm, self).__init__(*args, **kwargs)    
        self.fields['created_by'].widget = forms.HiddenInput()
        self.fields['slug'].widget = forms.HiddenInput()
    
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'
            if field == 'year_publish':
                self.fields['year_publish'].widget = AdminDateWidget(attrs={
                    'type':'date',
                    'class': 'form-control',
                })
                

        