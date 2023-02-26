from helper.form import AbstractForm
from disease.models.references import Article
from users.models import Profile

class ProfileForm(AbstractForm):
    class Meta:
        model = Profile
        fields = "__all__"