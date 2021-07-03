import 'package:clean_architecture_tdd_course/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetRandomNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(() => mockNumberTriviaRepository.getRandomNumberTrivia())
          .thenAnswer((_) async => const Right(tNumberTrivia));

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(NoParams());

      // UseCase should simply return whatever was returned from the Repository
      expect(result, const Right(tNumberTrivia));

      // Verify that the method has been called on the Repository
      verify(() => mockNumberTriviaRepository.getRandomNumberTrivia());

      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
