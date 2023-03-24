from helper.form import AbstractForm
from disease.models.references_model import Article
from users.models import Profile

class ProfileForm(AbstractForm):
    class Meta:
        model = Profile
        fields = "__all__"