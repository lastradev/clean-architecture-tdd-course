import 'package:clean_architecture_tdd_course/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });
  group('stringToUnsignedInteger', () {
    test(
        'should return an integer when the string represents an unsigned integer',
        () {
      // arrange
      const str = '123';
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, const Right(123));
    });

    test(
        'should return a Failure when the string does not represents an unsigned integer',
        () {
      // arrange
      const str = 'abc';
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });

    test(
        'should return a Failure when the string represents a negative integer',
        () {
      // arrange
      const str = '-1';
      // act
      final result = inputConverter.stringToUnsignedInteger(str);
      // assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
