class PhoneNumberFormatterService {
  static String formatIndiaPhoneNumber(int phoneNumber) {
    String phoneNummberAsString = phoneNumber.toString();
    if (phoneNummberAsString.length == 10) {
      String firstPart = phoneNummberAsString.substring(0, 5);
      String secondPart = phoneNummberAsString.substring(5, 10);
      return '+91 $firstPart $secondPart';
    } else {
      return phoneNumber.toString();
    }
  }

  static String formatIndiaPhoneNumberWithoutCode(int phoneNumber) {
    String phoneNummberAsString = phoneNumber.toString();
    if (phoneNummberAsString.length == 10) {
      String firstPart = phoneNummberAsString.substring(0, 5);
      String secondPart = phoneNummberAsString.substring(5, 10);
      return '$firstPart $secondPart';
    } else if (phoneNummberAsString.length > 5 &&
        phoneNummberAsString.length < 10) {
      String firstPart = phoneNummberAsString.substring(0, 5);
      String secondPart =
          phoneNummberAsString.substring(5, phoneNummberAsString.length);
      return '$firstPart $secondPart';
    } else {
      return phoneNumber.toString();
    }
  }

  static int unformatIndiaPhoneNumberWithoutCode(String phoneNumber) {
    return int.tryParse(phoneNumber.split(" ").join('')) ?? 0;
  }
}
