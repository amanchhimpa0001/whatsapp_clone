class TextValidatioinController {
  static isNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your Number";
    } else if (value.length < 10) {
      return "Please enter 10 Number";
    } else {
      return null;
    }
  }

  static isTextValid(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid input";
    } else {
      return null;
    }
  }
}
