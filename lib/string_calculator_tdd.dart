int add(String val) {
  int sum = 0;
  if (val == "") {
    return sum;
  }
  String customDelimiter = "";
  RegExp delimiter = RegExp(r'[,\n]');
  val = val.trim();
  if (val.startsWith('//')) {
    final delimiterSectionEnd = val.indexOf('\n');
    customDelimiter = val.substring(2, delimiterSectionEnd);
    delimiter = RegExp(RegExp.escape(customDelimiter)); // Escape regex chars
    val = val.substring(delimiterSectionEnd + 1);
  }
  if (customDelimiter == "" &&
      (val.contains(',\n') ||
          val.contains('\n,') ||
          val.contains(',,') ||
          val.contains('\n\n'))) {
    throw FormatException(
        "Invalid delimiter sequence: no mixed or repeated delimiters allowed.");
  }
  if (customDelimiter != "") {
    if (customDelimiter == "-") {
      throw FormatException("Invalid delimiter Used.");
    }
    if (!hasValidDelimiters(val, customDelimiter)) {
      throw FormatException(
          "Invalid delimiter sequence: Custom delimiter pattern not found.");
    }
  }
  List<String> splittedString = val.split(delimiter);
  if (splittedString.any((element) => element.trim().isEmpty)) {
    throw FormatException("Empty values between delimiters are not allowed.");
  }
  final List<int> negatives = [];
  for (var part in splittedString) {
    int number = int.tryParse(part.trim()) ?? 0; // Safely parse to int
    if (number < 0) {
      negatives.add(number);
    } else {
      if (number <= 1000) {
        sum += number;
      }
    }
  }
  if (negatives.isNotEmpty) {
    throw Exception("Negative Numbers not allowed < ${negatives.join(',')} >");
  } else {
    return sum;
  }
}

bool hasValidDelimiters(String input, String delimiter) {
  final escaped = RegExp.escape(delimiter);
  final regex = RegExp('^-?\\d+(?:$escaped-?\\d+)*\$');
  return regex.hasMatch(input);
}
