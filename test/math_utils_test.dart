// test/math_utils_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_app/math_utils.dart';
void main() {
  group('Calculator', () {
    test('add() should return the sum of two integers', () {
      // Arrange
      final calc = Calculator();

      // Act
      final result = calc.add(2, 3);

      // Assert
      expect(result, 5);
    });

    test('add() with negatives works correctly', () {
      final calc = Calculator();
      expect(calc.add(-4, 1), -3);
      expect(calc.add(-2, -3), -5);
    });
  });
  group('MathUtils.doubleIt', () {
    test('should return double the input value', () {
      expect(Calculator.doubleIt(2), 4);
      expect(Calculator.doubleIt(-3), -6);
      expect(Calculator.doubleIt(0), 0);
    });
  });
}
