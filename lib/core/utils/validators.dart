/// Centralized input validation and sanitization utility.
abstract class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.\_%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp _phoneRegExp = RegExp(
    r'^\+?[0-9]{7,15}$',
  );

  /// Validates email address syntax.
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email address is required';
    }
    final trimmed = value.trim();
    if (!_emailRegExp.hasMatch(trimmed)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  /// Validates password length and complexity.
  static String? validatePassword(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters long';
    }
    return null;
  }

  /// Validates person name input.
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  /// Validates phone number input.
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final trimmed = value.trim();
    if (!_phoneRegExp.hasMatch(trimmed)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  /// Sanitizes text input by trimming and stripping HTML/script characters.
  static String sanitizeInput(String input) {
    return input
        .trim()
        .replaceAll(RegExp(r'<[^>]*>'), '')
        .replaceAll(RegExp(r'[<>]'), '');
  }
}
