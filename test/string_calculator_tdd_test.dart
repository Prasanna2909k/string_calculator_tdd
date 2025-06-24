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
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });
    test('Single Digit Case', () {
      print('Success Test Case 2');
      try {
        expect(add('5'), equals(5));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });
    test('Comma Seperated Two Value Case', () {
      print('Success Test Case 3');

      try {
        expect(add('5,7'), equals(12));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Single Value with NewLine', () {
      print('Success Test Case 4');

      try {
        expect(add('\n5'), equals(5));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('New Line Seperated Two Value Case', () {
      print('Success Test Case 5');

      try {
        expect(add('5\n7'), equals(12));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Multiple Values with NewLine and Comma', () {
      print('Success Test Case 6');
      try {
        expect(add('5,8\n7\n3,2\n22,44,121\n812'), equals(1024));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Custom Delimiter Case', () {
      print('Success Test Case 7');
      try {
        expect(add('//;\n1;2'), equals(3));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('Test Failed $e');
      }
    });

    test('Custom Delimiter Case Single Value', () {
      print('Success Test Case 8');
      try {
        expect(add('//;\n1'), equals(1));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Custom Delimiter Case Multiple Value', () {
      print('Success Test Case 9');
      try {
        expect(add('//;\n1;2;3;7'), equals(13));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });
    test('Greater Than 1000 ignore', () {
      print('Success Test Case 10');
      try {
        expect(add('//;\n1;2;3;1000;8000'), equals(1006));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Custom Delimiter more than 1 chars', () {
      print('Success Test Case 11');
      try {
        expect(add('//***\n1***2***3'), equals(6));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Custom Multiple Delimiter Single char', () {
      print('Success Test Case 12');
      try {
        expect(add('//[*][%]\n1*2%3'), equals(6));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
      }
    });

    test('Custom Multiple Delimiter more than 1 chars', () {
      print('Success Test Case 13');
      try {
        expect(add('//[*#][%#]\n1*#2%#3%#8'), equals(14));
        print('✅ Test Passed');
      } catch (e) {
        expect(e, isA<Exception>());
        fail('❌ Test Failed $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
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
          print('✅ Test Passed: FormatException thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Multiple Value with NewLine and Comma', () {
      print('Exception Test Case 7');
      try {
        add(',\n5,\n\n8,7,3,2,22,\n,44,121\n\n812');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Custom Delimiter Case', () {
      print('Exception Test Case 8');
      try {
        add('//;\n1:2');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Custom Delimiter Case Single Value', () {
      print('Exception Test Case 9');
      try {
        add('//;\n1;');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Custom Delimiter Case Multiple Value', () {
      print('Exception Test Case 10');
      try {
        add('//;\n1;2;3:4;5:6');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is FormatException) {
          print('✅ Test Passed: FormatException thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Negative Value Case', () {
      print('Exception Test Case 11');
      try {
        add('//;\n1;2;3;4;5;-6');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is Exception) {
          print('✅ Test Passed: Exception thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });

    test('Custom Multiple Delimiter Single char', () {
      print('Exception Test Case 12');
      try {
        add('//[*][#]\n1*2%3');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is Exception) {
          print('✅ Test Passed: Exception thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });
    test('Custom Multiple Delimiter more than 1 chars', () {
      print('Exception Test Case 13');
      try {
        add('//[*#][##]\n1*#2%#3');
        print('❌ Test Failed: Expected FormatException but none thrown');
        fail('Expected exception not thrown');
      } catch (e) {
        if (e is Exception) {
          print('✅ Test Passed: Exception thrown as expected $e');
        } else {
          print('❌ Test Failed: Unexpected exception type $e');
          fail('Wrong exception type');
        }
      }
    });
  });
}
