from django.test import TestCase
from django.core.exceptions import ValidationError
from user_app.models import App_user, User_profile

# Create your tests here.


class UserModelCreation(TestCase):
    def setUp(self):
        self.user_data = {
            "email": "fr@fr.com",
            "username": "fr@fr.com",
            "display_name": "fravila08",
            "password": "P3R553U5@#b",
        }

    def creating_a_user(self, data):
        potential_user = App_user(**data)
        potential_user.full_clean()
        potential_user.save()
        return potential_user

    def test_creating_a_user(self):
        try:
            potential_user = self.creating_a_user(self.user_data)
            self.assertIsInstance(potential_user, App_user)
        except Exception as e:
            # print(e)
            self.fail()

    def test_missing_display_name(self):
        del self.user_data["display_name"]
        # print(self.user_data)
        try:
            self.creating_a_user(self.user_data)
            self.fail()
        except ValidationError as e:
            self.assertDictEqual(
                e.message_dict, {"display_name": ["This field cannot be blank."]}
            )

    def test_missing_email(self):
        del self.user_data["email"]
        # print(self.user_data)
        try:
            self.creating_a_user(self.user_data)
            self.fail()
        except ValidationError as e:
            # print(e)
            self.assertDictEqual(
                e.message_dict, {"email": ["This field cannot be blank."]}
            )

    def test_password_meeting_ONLY_digit_requirement(self):
        self.user_data["password"] = "123456"
        try:
            self.creating_a_user(self.user_data)
            self.fail()
        except ValidationError as e:
            # print(e)
            self.assertDictEqual(
                e.message_dict,
                {
                    "password": [
                        "Password must be between 8 and 12 characters long.",
                        "Password must contain at least one special character.",
                        "Password must contain at least one lowercase letter.",
                        "Password must contain at least one uppercase letter.",
                    ]
                },
            )

class UserProfileCreation(TestCase):

    def setUp(self):
        user_data = {
            "email": "fr@fr.com",
            "username": "fr@fr.com",
            "display_name": "fravila08",
            "password": "P3R553U5@#b",
        }
        self.user = App_user.objects.create_user(**user_data)

    def test_creating_profile_with_default_values(self):
        try:
            new_profile = User_profile(user= self.user)
            new_profile.full_clean()
            new_profile.save()
            self.assertIsInstance(new_profile, User_profile)
        except Exception as e:
            print(e)
            self.fail()
    
    def test_creating_profile_with_default_picture(self):
        try:
            new_profile = User_profile.objects.create(user= self.user)
            self.assertEqual(new_profile.picture, "defaults/default_user.png")
        except Exception as e:
            print(e)
            self.fail()

