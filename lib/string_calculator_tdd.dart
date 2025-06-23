int add(String val) {
  val = val.trim();
  int sum = 0;
  if (val == "") {
    return sum;
  }
  RegExp delimiter = RegExp(r'[,\n]');
  List<String> splittedString = val.split(delimiter);
  for (var part in splittedString) {
    int number = int.tryParse(part.trim()) ?? 0; // Safely parse to int
    sum += number;
  }
  return sum;
}
