int add(String val) {
  int sum = 0;
  if (val == "") {
    return sum;
  }
  String customDelimiter = "";
  List<String> splittedDelimiter = [];
  RegExp delimiter = RegExp(r'[,\n]');
  RegExp multdelimiter = RegExp('');
  val = val.trim();
  if (val.startsWith('//')) {
    final delimiterSectionEnd = val.indexOf('\n');
    customDelimiter = val.substring(2, delimiterSectionEnd);
    if (customDelimiter.contains('[') && customDelimiter.contains(']')) {
      multdelimiter = RegExp(r'\[(.*?)\]');
      splittedDelimiter = multdelimiter
          .allMatches(customDelimiter)
          .map((match) => match.group(1)!)
          .toList();
    }
    if (splittedDelimiter.isEmpty) {
      delimiter = RegExp(RegExp.escape(customDelimiter));
    } else {
      delimiter = RegExp(splittedDelimiter.map(RegExp.escape).join('|'));
    }
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
    if (splittedDelimiter.isEmpty &&
        !hasValidDelimiters(val, customDelimiter)) {
      throw FormatException(
          "Invalid delimiter sequence: Custom delimiter pattern not found.");
    }
     if (splittedDelimiter.isNotEmpty &&
        !hasValidDelimitersMultiple(val, splittedDelimiter)) {
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

bool hasValidDelimitersMultiple(String input, List<String> delimiter) {
  if (delimiter.isEmpty) return false;
  final escaped = delimiter.map(RegExp.escape).join('|');
  final regex = RegExp(r'^-?\d+(?:(' + escaped + r')-?\d+)*$');
  return regex.hasMatch(input);
}
