import 'package:string_calculator_tdd/string_calculator_tdd.dart';
import 'package:test/test.dart';

void main() {
  //Success Test Cases
  //dart test --name "StringCalculatorSuccess"
  //dart test --chain-stack-traces --name "StringCalculatorSuccess"
  group('StringCalculatorSuccess', () {
    test('Empty String Result Case', () {
      print('Success Test Case 1');
      try {
        expect(add(''), equals(0));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Comma Case', () {
      print('Success Test Case 2');
      try {
        expect(add(','), equals(0));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Multiple Comma Case', () {
      print('Success Test Case 3');
      try {
        expect(add(',,,,,,,,,,,'), equals(0));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Blank Space Case', () {
      print('Success Test Case 4');
      try {
        expect(add('                         '), equals(0));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Single Digit Case', () {
      print('Success Test Case 5');
      try {
        expect(add('5'), equals(5));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Comma Seperated Two Value Case', () {
      print('Success Test Case 6');

      try {
        expect(add('5,7'), equals(12));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
  });
}
