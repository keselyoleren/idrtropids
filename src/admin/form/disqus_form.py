from django import forms
from disease.models.diseases_model import Disease
from disease.models.disqus_model import Answer, Question
from helper.form import AbstractForm


class QuestionFormAdmin(AbstractForm):
    class Meta:
        model = Question
        fields = "__all__"


    def __init__(self, *args, **kwargs):
        super(QuestionFormAdmin, self).__init__(*args, **kwargs)
        self.fields['diseases'].widget = forms.HiddenInput()
        self.fields['parent'].widget = forms.HiddenInput()
        self.fields['user'].widget = forms.HiddenInput()
        self.fields['is_validate'].widget = forms.HiddenInput()
        self.fields['asign_to'].widget.attrs['hidden'] = True
        self.fields['asign_to'].label = ''
        self.fields['asign_to'].help_text = ''

        # self.fields['asign_to'].widget = forms.HiddenInput()
        




# class QuestionForm(forms.ModelForm):
#     class Meta:
#         model = Question
#         fields = "__all__"

#     def __init__(self, *args, **kwargs):
#         super(QuestionForm, self).__init__(*args, **kwargs)
#         self.fields['diseases'].widget = forms.HiddenInput()
#         self.fields['parent'].widget = forms.HiddenInput()
#         self.fields['user'].widget = forms.HiddenInput()
#         self.fields['is_validate'].widget = forms.HiddenInput()
#         self.fields['question'].widget.attrs['class'] = 'materialize-textarea'

class AnswerForm(forms.ModelForm):
    class Meta:
        model = Answer
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super(AnswerForm, self).__init__(*args, **kwargs)
        self.fields['question'].widget = forms.HiddenInput()
        self.fields['author'].widget = forms.HiddenInput()
        