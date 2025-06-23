import 'package:string_calculator_tdd/string_calculator_tdd.dart' as string_calculator_tdd;

void main(List<String> arguments) {
  print('Result 1: ${string_calculator_tdd.add("")}');
  print('Result 2: ${string_calculator_tdd.add(",")}');
  print('Result 3: ${string_calculator_tdd.add(",,,,,,,,,,,,,,,")}');
  print('Result 4: ${string_calculator_tdd.add("                ")}');
  print('Result 5: ${string_calculator_tdd.add("5")}');
  print('Result 6: ${string_calculator_tdd.add("5,7")}');
}
