import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';
import 'package:numbers/features/numbers/domain/use_cases/get_concret_num_as_class.dart';

/// THREE: create class for mocking the repo contract
/// also this is the Implementation class as test
class MockNumberRepoContract extends Mock implements NumberRepoContract {}

void main() {
  /// FOUR: the use-case that created in step two
  /// is initialized here to can run and test
  /// the getNumbers with it
  GetConcreteNumberAsClass useCase;

  /// FIVE: implementation class, but in testing-way not production-way
  MockNumberRepoContract mockNumberRepoContract;

  setUp(() {
    mockNumberRepoContract = MockNumberRepoContract();
    useCase = GetConcreteNumberAsClass(mockNumberRepoContract);
  });

  /// SIX: Testing data similar for the real ones
  final tNumber = 1;
  final tNumberModel = NumbersModel(number: 1, text: 'testing with Number One');

  test(
    'should get trivia for the  Number From Repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberAsMethod is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      /// arrange
      /// this like setting a condition to this method calling
      /// to return this type all  the time
      when(mockNumberRepoContract.getConcreteNumberAsMethod(any))
          .thenAnswer((_) async => Right(tNumberModel));

      /// act
      // The "act" phase of the test. Call the not-yet-existent method.
      /// this method return matches the above statement return
      final result = await useCase(Params(number: tNumberModel.number));

      /// assert
      // UseCase should simply return whatever was returned from the Repository
      /// comparing the result getConcreteNumberAsMethod with any number here
      /// with the result of the same method inside execute of the use case
      expect(result, Right(tNumberModel));
      // Verify that the method has been called on the Repository
      verify(mockNumberRepoContract.getConcreteNumberAsMethod(tNumber));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockNumberRepoContract);
    },
  );
}
