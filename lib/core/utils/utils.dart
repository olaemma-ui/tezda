// import 'package:tezda/core/logger/logger.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

abstract class Utils {
  static String? validatePassword(String password) {
    // Check if the password is at least 8 characters long
    if (password.length < 8 ||
        !RegExp(r'[A-Z]').hasMatch(password) ||
        !RegExp(r'[a-z]').hasMatch(password) ||
        !RegExp(r'\d').hasMatch(password)) {
      return 'Password should contain one Uppercase, Lowercase,Number and 8 characters long';
    }

    // // Check for an uppercase letter
    // if (!RegExp(r'[A-Z]').hasMatch(password)) {
    //   return 'Password must contain at least one uppercase letter';
    // }

    // // Check for a lowercase letter
    // if (!RegExp(r'[a-z]').hasMatch(password)) {
    //   return 'Password must contain at least one lowercase letter';
    // }

    // // Check for a number
    // if (!RegExp(r'\d').hasMatch(password)) {
    //   return 'Password must contain at least one number';
    // }

    // // Check for a special character
    // if (!RegExp(r'[@$!%*?&]').hasMatch(password)) {
    //   return 'Password must contain at least one special character';
    // }

    // If all validations pass, return null (indicating no error)
    return null;
  }

  // Phone number validation with debugPrint
  static String? validatePhoneNumber(String phoneNumber) {
    debugPrint('📞 Validating phone number: $phoneNumber');
    debugPrint('🔢 Length: ${phoneNumber.length}');

    // Check length
    if (phoneNumber.length < 9 || phoneNumber.length > 15) {
      debugPrint('❌ Invalid length: ${phoneNumber.length}');
      return 'Please enter a valid mobile number with 9 to 10 digits';
    } else {
      debugPrint('✅ Valid length');
    }
    // // Check for valid country code
    // if (!RegExp(r'^\+?\d{1,3}').hasMatch(phoneNumber)) {
    //   debugPrint('❌ Invalid country code format');
    //   return 'Phone number must start with a valid country code';
    // } else {
    //   debugPrint('✅ Valid country code format');
    // }
    // If all validations pass
    debugPrint('✅ Phone number is valid');
    return null;
  }
}
