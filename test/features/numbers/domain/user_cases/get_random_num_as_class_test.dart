import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:numbers/core/use_cases/user_case_contract.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';
import 'package:numbers/features/numbers/domain/use_cases/get_random_num_as_class.dart';

class MockNumberRepoContract extends Mock implements NumberRepoContract {}

void main() {
  GetRandomNumberAsClass useCase;

  MockNumberRepoContract mockNumberRepoContract;

  setUp(() {
    mockNumberRepoContract = MockNumberRepoContract();
    useCase = GetRandomNumberAsClass(mockNumberRepoContract);
  });

  final tNumberModel = NumbersModel(number: 1, text: 'test');

  test(
    'should get trivia for the random Number From Repository',
    () async {
      /// arrange
      when(mockNumberRepoContract.getRandomNumberAsMethod())
          .thenAnswer((_) async => Right(tNumberModel));

      /// act
      final result = await useCase(NoParams());

      /// assert
      expect(result, Right(tNumberModel));
      verify(mockNumberRepoContract.getRandomNumberAsMethod());
      verifyNoMoreInteractions(mockNumberRepoContract);
    },
  );
}
