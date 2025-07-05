import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];

/// This extension is used to add methods to the String class
/// It is used to get the file size, convert to date time, convert to hex color,
/// validate the string, and get the password strength
extension StringEnxtension on String {
  /// This method is used to get the file size of the string
  /// It is used to get the file size of the string
  /// It is used to get the file size of the string
  getFileSize({int decimals = 1}) async {
    int bytes = length;
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  /// This method is used to convert the string to a date time
  /// It is used to convert the string to a date time
  /// It is used to convert the string to a date time
  DateTime toDateTime() {
    DateFormat format = DateFormat("MMMM d, yyyy");
    return format.parse(this);
  }

  /// This method is used to convert the string to a hex color
  /// It is used to convert the string to a hex color
  /// It is used to convert the string to a hex color
  Color hex() {
    return Color(int.parse(replaceAll('#', '0xFF')));
  }

  /// This method is used to get the password strength of the string
  /// It is used to get the password strength of the string
  /// It is used to get the password strength of the string
  Map<String, dynamic> get password => _password();

  /// This method is used to get the password strength of the string
  /// It is used to get the password strength of the string
  /// It is used to get the password strength of the string
  _password() {
    bool upper = RegExp(r'[A-Z]').hasMatch(this);
    bool lower = RegExp(r'[a-z]').hasMatch(this);
    bool number = RegExp(r'[0-9]').hasMatch(this);
    bool symbol = RegExp(r'[(!@#$%^&*)]').hasMatch(this);
    bool length = this.length >= 8;
    return {
      'upper': upper,
      'lower': lower,
      'number': number,
      'symbol': symbol,
      'length': length
    };
  }

  /// This method is used to validate the string
  /// It is used to validate the string
  /// It is used to validate the string
  validate({required String key, required Map errors}) {
    bool valid = false;
    if (key.toLowerCase().contains('name')) {
      errors[key].value = (isNotEmpty)
          ? (isAlphabetOnly)
              ? ''
              : 'Please enter your full name.'
          : 'Please enter your full name.';
      valid = isNotEmpty ? isAlphabetOnly : false;
    }
    if (key == 'email') {
      errors[key].value = (isNotEmpty)
          ? (isEmail)
              ? ''
              : 'Please enter a valid email address.'
          : 'Please enter a valid email address.';
      valid = isNotEmpty ? isEmail : false;
    }
    if (key == 'phone') {
      errors[key].value = (isNotEmpty)
          ? (isPhoneNumber)
              ? ''
              : 'Please enter a valid phone number.'
          : 'Please enter a valid phone number.';
      valid = isNotEmpty ? isPhoneNumber : false;
    }

    if (key == 'otp') {
      errors[key].value = (isNotEmpty)
          ? (isNumericOnly)
              ? ''
              : 'Invalid OTP'
          : 'This field is required';
      valid = isNotEmpty ? isNumericOnly : false;
    }

    if (key.toLowerCase().contains('password')) {
      errors[key].value =
          (isNotEmpty) ? '' : 'Password must be at least 8 characters long. ';
      valid = isNotEmpty;
    }

    return valid;
  }

  bool get isAlphabetOnly => RegExp(r'^[a-zA-Z]+$').hasMatch(this);

  bool get isEmail =>
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
          .hasMatch(this);

  bool get isPhoneNumber => RegExp(r'^[0-9]{10}$').hasMatch(this);

  bool get isNumericOnly => RegExp(r'^[0-9]+$').hasMatch(this);
}

/// This extension is used to add methods to the File class
/// It is used to get the file size, convert to date time, convert to hex color,
/// validate the string, and get the password strength
extension FileIoExtension on File {
  /// This method is used to get the file size of the file
  /// It is used to get the file size of the file
  /// It is used to get the file size of the file
  getFileSize({int decimals = 1}) async {
    int bytes = await length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

/// This extension is used to add methods to the DateTime class
/// It is used to get the file size, convert to date time, convert to hex color,
/// validate the string, and get the password strength
extension DateExtension on DateTime? {
  String? get toActualDate => this == null ? null : _getActualDate(this!);

  String? get toActualDateAbbr =>
      this == null ? null : _getActualDateAbbr(this!);

  String? get toActualTime => this == null ? null : _toTimeFormat();

  String get timeAgo => _timeAgo(this!);

  String _timeAgo(DateTime dateTime) {
    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} ${((difference.inDays / 7).floor() == 1) ? 'week' : 'weeks'} ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} ${((difference.inDays / 30).floor() == 1) ? 'month' : 'months'} ago';
    } else {
      return '${(difference.inDays / 365).floor()} ${((difference.inDays / 365).floor() == 1) ? 'year' : 'years'} ago';
    }
  }

  String _toTimeFormat() {
    // Determine hour in 12-hour format
    int hour = this!.hour % 12 == 0 ? 12 : this!.hour % 12;

    // Determine AM/PM
    String period = this!.hour >= 12 ? 'PM' : 'AM';

    // Format minute with leading zero if necessary
    String minute = this!.minute.toString().padLeft(2, '0');

    return '$hour:$minute $period';
  }

  String? timeLeft({required DateTime endDate}) => _formatTimeLeft(
        this,
        endDate,
      );

  String _formatTimeLeft(DateTime? endDate, DateTime startDate) {
    if (endDate == null) {
      return 'Expired'; // Return a default message if `endDate` is null
    }

    final duration = endDate.difference(startDate);
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;

    return '${days}d : ${hours}h : ${minutes}m';
  }
}

/// This method is used to get the actual date of the date
/// It is used to get the actual date of the date
/// It is used to get the actual date of the date
String _getActualDate(DateTime date) {
  final parsedDate = date;
  return '${_getMonthName(parsedDate.month)} ${parsedDate.day}, ${parsedDate.year}';
}

/// This method is used to get the actual date abbreviation of the date
/// It is used to get the actual date abbreviation of the date
/// It is used to get the actual date abbreviation of the date
String _getActualDateAbbr(DateTime date) {
  final parsedDate = date;
  return '${_getMonthAbbr(parsedDate.month)} ${parsedDate.day}, ${parsedDate.year}';
}

/// This method is used to get the month name of the month
/// It is used to get the month name of the month
/// It is used to get the month name of the month
String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return 'Unknown';
  }
}

/// This method is used to get the month abbreviation of the month
/// It is used to get the month abbreviation of the month
/// It is used to get the month abbreviation of the month
String _getMonthAbbr(int month) {
  switch (month) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'Jul';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return 'Unknown';
  }
}

/// This  extension is used to add methods to the int class
/// It is used to get the duration of the int
/// It is used to get the duration of the int
extension IntExtension on int {
  String get toDuration => _formatDuration();

  String _formatDuration() {
    final minutes = (this ~/ 60).toString().padLeft(2, '0');
    final seconds = (this % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  String get toDurationAbbr => _formatDurationAbbr();

  String _formatDurationAbbr() {
    final minutes = (this ~/ 60).toString();
    final seconds = (this % 60).toString();
    return '$minutes:$seconds';
  }
}
