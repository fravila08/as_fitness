from django.core.exceptions import ValidationError

def weight_validator(weight):
    min_weight = {"w":50.00,"m":"Can't way less than 50 pounds"}
    max_weight = {"w":450.00,"m":"Can't way more than 450 pounds"}
    if min_weight.get("w") > weight:
        raise ValidationError(min_weight.get("m"))
    elif max_weight.get("w") < weight:
        raise ValidationError(min_weight.get("m"))
    return weight