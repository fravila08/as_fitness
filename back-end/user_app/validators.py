from django.core.exceptions import ValidationError
import re

def weight_validator(weight):
    min_weight = {"w":50.00,"m":"Can't way less than 50 pounds"}
    max_weight = {"w":450.00,"m":"Can't way more than 450 pounds"}
    if min_weight.get("w") > weight:
        raise ValidationError(min_weight.get("m"))
    elif max_weight.get("w") < weight:
        raise ValidationError(min_weight.get("m"))
    return weight

def validate_password(value):
    errors = []
    # Check length
    if len(value) < 8 or len(value) > 12:
        errors.append('Password must be between 8 and 12 characters long.')

    # Check for at least one special character
    if not re.search(r'[^a-zA-Z0-9]', value):
        errors.append('Password must contain at least one special character.')

    # Check for at least one digit
    if not re.search(r'\d', value):
        errors.append('Password must contain at least one digit.')

    # Check for at least one lowercase letter
    if not re.search(r'[a-z]', value):
        errors.append('Password must contain at least one lowercase letter.')

    # Check for at least one uppercase letter
    if not re.search(r'[A-Z]', value):
        errors.append('Password must contain at least one uppercase letter.')
    if errors:
        raise ValidationError(errors)