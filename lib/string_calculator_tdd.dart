int add(String val) {
  int sum = 0;
  if (val == "") {
    return sum;
  }
  val = val.trim();
  if (val.contains(',\n') || val.contains('\n,') || val.contains(',,') || val.contains('\n\n')) {
    throw FormatException("Invalid delimiter sequence: no mixed or repeated delimiters allowed.");
  }
  RegExp delimiter = RegExp(r'[,\n]');
  List<String> splittedString = val.split(delimiter);
  if (splittedString.any((element) => element.trim().isEmpty)) {
    throw FormatException("Empty values between delimiters are not allowed.");
  }

  for (var part in splittedString) {
    int number = int.tryParse(part.trim()) ?? 0; // Safely parse to int
    sum += number;
  }
  return sum;
}
