from django import forms
from django.contrib.admin.widgets import (
    AdminDateWidget,
)

class AbstractForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(AbstractForm, self).__init__(*args, **kwargs)    
        for field in self.fields:
            if field == 'created_by':
                self.fields['created_by'].widget = forms.HiddenInput()
            if field == 'slug':
                self.fields['slug'].widget = forms.HiddenInput()
            if field == 'status':
                self.fields['status'].widget = forms.HiddenInput()
            if field == 'editor':
                self.fields['editor'].widget = forms.HiddenInput()
            if field == 'visits':
                self.fields['visits'].widget = forms.HiddenInput()
            
            self.fields[field].widget.attrs['class'] = 'form-control'
            if field == 'year_publish':
                self.fields['year_publish'].widget = AdminDateWidget(attrs={
                    'type':'date',
                    'class': 'form-control',
                })
                
            if field == 'date':
                self.fields['date'].widget = AdminDateWidget(attrs={
                    'type':'date',
                    'class': 'form-control',
                })
                
                

        