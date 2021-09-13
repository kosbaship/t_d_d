import 'package:dartz/dartz.dart';
import 'package:numbers/core/error/failure.dart';
import 'package:numbers/core/use_cases/user_case_contract.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';

class GetRandomNumberAsClass implements UseCase<NumbersModel, NoParams> {
  final NumberRepoContract repository;

  GetRandomNumberAsClass(this.repository);

  @override
  Future<Either<Failure, NumbersModel>> call(NoParams noParams) async =>
      await repository.getRandomNumberAsMethod();
}
