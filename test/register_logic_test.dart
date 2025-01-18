import 'package:flutter_test/flutter_test.dart';
import 'package:CPD_final_app/utils/register_logic.dart';

void main() {
  group('RegisterLogic Tests', () {
    final registerLogic = RegisterLogic();

    test('Geeft foutmelding als velden leeg zijn', () {
      // Arrange
      const name = '';
      const password = '';
      const confirmPassword = '';

      // Act
      final result = registerLogic.validateInput(name, password, confirmPassword);

      // Assert
      expect(result, 'Vul alle velden in.');
    });

    test('Geeft foutmelding als wachtwoorden niet overeenkomen', () {
      // Arrange
      const name = 'testuser';
      const password = 'password123';
      const confirmPassword = 'password321';

      // Act
      final result = registerLogic.validateInput(name, password, confirmPassword);

      // Assert
      expect(result, 'Wachtwoorden komen niet overeen.');
    });

    test('Geeft geen foutmelding bij correcte input', () {
      // Arrange
      const name = 'testuser';
      const password = 'password123';
      const confirmPassword = 'password123';

      // Act
      final result = registerLogic.validateInput(name, password, confirmPassword);

      // Assert
      expect(result, isNull);
    });
  });
}
