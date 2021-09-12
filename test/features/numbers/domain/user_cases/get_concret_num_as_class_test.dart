import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';
import 'package:numbers/features/numbers/domain/use_cases/get_concret_num_as_class.dart';

// this what test created for
class MockNumberRepoContract extends Mock implements NumberRepoContract {}

void main() {
  // this the use case for one of the functions as class
  GetConcreteNumberAsClass useCase;

  /// 1- all the test is for this repo contract
  MockNumberRepoContract mocNumberRepoContract;

  setUp(() {
    mocNumberRepoContract = MockNumberRepoContract();
    useCase = GetConcreteNumberAsClass(mocNumberRepoContract);
  });

  final tNumber = 1;
  final tNumberModel = NumbersModel(number: 1, text: 'testing with Number One');

  test(
    'should get Number From Repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When getConcreteNumberTrivia is called with any argument, always answer with
      // the Right "side" of Either containing a test NumberTrivia object.
      when(mocNumberRepoContract.getConcreteNumberAsMethod(any))
          .thenAnswer((_) async => Right(tNumberModel));
      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await useCase.execute(number: tNumber);
      // UseCase should simply return whatever was returned from the Repository
      expect(result, Right(tNumberModel));
      // Verify that the method has been called on the Repository
      verify(mocNumberRepoContract.getConcreteNumberAsMethod(tNumber));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mocNumberRepoContract);
    },
  );
}
