from django.db import models
from django.contrib.auth.models import AbstractUser
import uuid


# Create your models here.
class App_user(AbstractUser):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    password = models.CharField(max_length=8)
    email = models.EmailField(blank=False, unique=True)
    display_name = models.CharField(max_length=25)
    EMAIL_FIELD = "email"
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS=["display_name"]

    def __str__(self):
        return self.display_name
