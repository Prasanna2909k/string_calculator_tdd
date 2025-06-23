import 'package:string_calculator_tdd/string_calculator_tdd.dart' as string_calculator_tdd;

void main(List<String> arguments) {
  print('Result 1: ${string_calculator_tdd.add("")}');
  print('Result 2: ${string_calculator_tdd.add(",")}');
  print('Result 3: ${string_calculator_tdd.add(",,,,,,,,,,,,,,,")}');
  print('Result 4: ${string_calculator_tdd.add("                ")}');
  print('Result 5: ${string_calculator_tdd.add("5")}');
  print('Result 6: ${string_calculator_tdd.add("5,7")}');
  print('Result 7: ${string_calculator_tdd.add("\n")}');
  print('Result 8: ${string_calculator_tdd.add("\n5")}');
  print('Result 9: ${string_calculator_tdd.add("\n5\n\n\n7")}');
  print('Result 10: ${string_calculator_tdd.add("\n5,\n,\n,\n\n,7")}');
  print('Result 11: ${string_calculator_tdd.add(",\n5,\n\n8,7,3,2,22,\n,44,121\n\n812")}');
}
