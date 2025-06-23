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
    
    test('Only Newline', () {
      print('Success Test Case 7');

      try {
        expect(add('\n'), equals(0));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Single Value with NewLine', () {
      print('Success Test Case 8');

      try {
        expect(add('\n5'), equals(5));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Two Value with NewLine', () {
      print('Success Test Case 9');

      try {
        expect(add('\n5\n\n\n7'), equals(12));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Two Value with NewLine and Comma', () {
      print('Success Test Case 10');

      try {
        expect(add('\n5,\n,\n,\n\n,7'), equals(12));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Multiple Values with NewLine and Comma', () {
      print('Success Test Case 11');
      try {
        expect(add(',\n5,\n\n8,7,3,2,22,\n,44,121\n\n812'), equals(1024));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
  });
}
