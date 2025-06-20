abstract class Validation{

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }

    // Basic email regex
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regex = RegExp(emailPattern);

    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null; // Valid
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Include at least one uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Include at least one lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Include at least one number';
    }

    if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Include at least one special character (!@#\$&*~)';
    }

    return null; // Valid
  }

  static String? validateName(String name) {
    if (name.isEmpty) {
      return 'Name is required';
    }

    if (name.length < 3) {
      return 'Name must be at least 3 characters long';
    }

    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(name)) {
      return 'Name can only contain letters and spaces';
    }

    return null; // valid
  }

  static String? validateMobile(String? value) {
    // Check if the field is empty
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }

    // Regular expression to check if input is digits only and 10 digits long
    final RegExp mobileRegex = RegExp(r'^\d{10}$');

    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }

    return null; // Valid input
  }

  static String? validateConfirmPassword(String? confirmPassword, String? originalPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Please confirm your password';
    }

    if (confirmPassword != originalPassword) {
      return 'Passwords do not match';
    }

    return null; // Valid
  }

  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }


}