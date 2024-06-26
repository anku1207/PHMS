String? validateMobileNumber(String value){
 // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String pattern = r'(^[6-9][0-9]{9}$)';
  RegExp regExp = new RegExp(pattern);
  if (value == "") {
    return 'mobile number is required';
  } else if (!regExp.hasMatch(value)) {
    return 'Mobile No. accepts only  numbers and length should be 10 (first number to start with [6-9]';
  }
  return null;
}
String? validateMobileNumberPattern(String value){
  // String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  String pattern = r'(^[6-9][0-9]{9}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.isEmpty) {
    return null;
  } else if (!regExp.hasMatch(value)) {
    return 'Mobile No. accepts only  numbers and length should be 10 (first number to start with [6-9]';
  }
  return null;
}

String? validateEmailPattern(String email) {
  // Define a regular expression for a valid email address
  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  if(email.isEmpty){
    return null;
  }else if(!emailRegex.hasMatch(email)){
    return 'please enter valid email address';
  }
  return null;
}


String? validateRequiredField(String? value){
  if (value == "") {
    return 'This field is required';
  }
  return null;
}
String? validateEmail(String email) {
  // Define a regular expression for a valid email address
  RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  if(email==""){
    return 'this field is required';
  }else if(!emailRegex.hasMatch(email)){
    return 'please enter valid email address';
  }
  return null;
}
