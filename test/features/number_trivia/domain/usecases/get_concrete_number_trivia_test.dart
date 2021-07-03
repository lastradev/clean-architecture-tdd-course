import 'package:clean_architecture_tdd_course/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_architecture_tdd_course/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test(
    'should get trivia for the number from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.

      // Old implementation
      // when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
      // .thenAnswer((_) async => Right(tNumberTrivia));

      when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any()))
          .thenAnswer((_) async => Right(tNumberTrivia));

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(const Params(number: tNumber));

      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberTrivia));

      // Verify that the method has been called on the Repository

      // Old implementation
      // verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

      verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
