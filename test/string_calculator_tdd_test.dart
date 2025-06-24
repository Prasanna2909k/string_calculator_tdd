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
    test('Single Digit Case', () {
      print('Success Test Case 2');
      try {
        expect(add('5'), equals(5));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
    test('Comma Seperated Two Value Case', () {
      print('Success Test Case 3');

      try {
        expect(add('5,7'), equals(12));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Single Value with NewLine', () {
      print('Success Test Case 4');

      try {
        expect(add('\n5'), equals(5));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });


    test('New Line Seperated Two Value Case', () {
      print('Success Test Case 5');

      try {
        expect(add('5\n7'), equals(12));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });

    test('Multiple Values with NewLine and Comma', () {
      print('Success Test Case 6');
      try {
        expect(
            add('5,8\n7\n3,2\n22,44,121\n812'), equals(1024));
        print('Test passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed');
      }
    });
  });

  //Exception Success Test Cases
  //dart test --name "StringCalculatorException"
  //dart test --chain-stack-traces --name "StringCalculatorException"
  group('StringCalculatorException', () {
    test('Comma Case', () {
      print('Exception Test Case 1');
      try {
        add(',');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Multiple Comma Case', () {
      print('Exception Test Case 2');
      try {
        add(',,,,,,,,,,,');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Blank Space Case', () {
      print('Exception Test Case 3');
      try {
        add('                         ');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Only New Line', () {
      print('Exception Test Case 4');
      try {
        add('\n');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Two Value with NewLine', () {
      print('Exception Test Case 5');
      try {
        add('\n5\n\n\n7');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Two Value with NewLine and Comma', () {
      print('Exception Test Case 6');
      try {
        add('\n5,\n,\n,\n\n,7');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Two Value with NewLine and Comma', () {
      print('Exception Test Case 7');
      try {
        add(',\n5,\n\n8,7,3,2,22,\n,44,121\n\n812');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });
  });
}
