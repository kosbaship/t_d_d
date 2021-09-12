import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:numbers/core/error/failure.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';

/// TWO: we create here the first use-case
/// it accepts a repo implementation even it's mocking it
/// and execute the function the get data
class GetConcreteNumberAsClass {
  final NumberRepoContract repository;

  GetConcreteNumberAsClass(this.repository);

  Future<Either<Failure, NumbersModel>> execute({
    @required int number,
  }) async {
    return await repository.getConcreteNumberAsMethod(number);
  }
}
