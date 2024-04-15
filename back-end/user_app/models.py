from django.db import models
from django.contrib.auth.models import AbstractUser


# Create your models here.
class App_user(AbstractUser):
    password = models.CharField(max_length=8)
    email = models.EmailField(blank=False, unique=True)
    display_name = models.CharField(max_length=25)
    EMAIL_FIELD = "email"
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS=[]
