A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

This Project is a Simple String Calculator developed with Dart using TDD(Test Driven Development). Test Cases are Written and present under test directory.

Input: Strings Seperated with delimiters(; or \n) Also Custom Delimiters are provided with (\\[Delimiter]\nInput1[Delimiter]Input2); eg:-(\\;\n1;2)
------

Output: Sum of numbers eg:=(3)
-------

Success Testcase and Failure Testcases were written seperately.

To Run Success case
-------------------
Whole Test Case
---------------
dart test --name "StringCalculatorSuccess"

Individual Test Case
--------------------

dart test --plain-name 'StringCalculatorSuccess Multiple Values with NewLine and Comma'


To Run Failure case
-------------------

dart test --name "StringCalculatorException"

Individual Test Case
--------------------

dart test --plain-name 'StringCalculatorException Multiple Values with NewLine and Comma'
