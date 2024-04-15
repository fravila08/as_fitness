from django.db import models
from django.conf import settings
from django.core import validators as v
from django.contrib.auth.models import AbstractUser
from .validators import weight_validator, validate_password
import uuid


# Create your models here.
class App_user(AbstractUser):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    password = models.CharField(max_length=255, validators=[validate_password])
    email = models.EmailField(blank=False, unique=True)
    display_name = models.CharField(max_length=25)
    EMAIL_FIELD = "email"
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["display_name"]

    def __str__(self):
        return self.display_name


class User_profile(models.Model):
    age = models.PositiveIntegerField(
        default=18, validators=[v.MinValueValidator(10), v.MaxValueValidator(120)]
    )
    weight = models.DecimalField(
        default=150.00, max_digits=5, decimal_places=2, validators=[weight_validator]
    )
    bio = models.TextField(
        default="I am excited to start my self improvement journey and take small steps for a better tomorrow",
        validators=[v.MinLengthValidator(50), v.MaxLengthValidator(500)],
    )
    picture = models.ImageField(
        upload_to="user_pictures/",
        null=True,
        blank=True,
        default=settings.DEFAULT_PICTURE_PATH,
    )
    user = models.OneToOneField(
        App_user, on_delete=models.CASCADE, related_name="profile"
    )
