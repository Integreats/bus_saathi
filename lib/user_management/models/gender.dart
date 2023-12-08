enum Gender {
  male,
  female,
  others,
}

extension GenderExtension on Gender {
  static Gender fromString(String genderInString) {
    Gender gender;

    switch (genderInString.toLowerCase().trim()) {
      case 'male':
        gender = Gender.male;
        break;
      case 'female':
        gender = Gender.female;
        break;
      case 'others':
        gender = Gender.others;
        break;
      default:
        gender = Gender.male;
    }
    return gender;
  }

  static String genderAsString(Gender gender) {
    String genderInString;

    switch (gender) {
      case Gender.male:
        genderInString = 'Male';
        break;
      case Gender.female:
        genderInString = 'Female';
        break;
      case Gender.others:
        genderInString = 'Others';
        break;
      default:
        genderInString = 'Male';
    }
    return genderInString;
  }
}
