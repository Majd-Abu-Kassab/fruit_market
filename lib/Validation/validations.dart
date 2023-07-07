import 'package:easy_localization/easy_localization.dart';
import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'.tr()),
  MinLengthValidator(8, errorText: 'Password must be at least 8 digits long'.tr()),
]);

final emailValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'),
  PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      errorText: 'Enter a valid email'.tr())
]);
final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Phone is required'.tr()),
  MinLengthValidator(10, errorText: 'phone must be 10 digits long'.tr()),
  PatternValidator(r"^(?:[+0][1-9])?[0-9]{10}$",
      errorText: 'Enter a valid phone'.tr())
]);
final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name is required'.tr()),
  MaxLengthValidator(10, errorText: 'Name must be 10 characters long or less'.tr()),
  PatternValidator(r"[a-zA-Z]",
      errorText: 'Enter a valid Name'.tr())
]);
final passwordLoginValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'.tr()),
]);
final emailLoginValidator = MultiValidator([
  RequiredValidator(errorText: 'Email is required'.tr()),
  PatternValidator(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      errorText: 'Enter a valid email'.tr())
]);
