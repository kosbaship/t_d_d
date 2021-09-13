import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:numbers/core/error/failure.dart';
import 'package:numbers/core/use_cases/user_case_contract.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';
import 'package:numbers/features/numbers/domain/repo_contract/numbers_repo_contract.dart';

/// TWO: we create here the first use-case
/// it accepts a repo implementation even it's mocking it
/// and execute the function the get data
class GetConcreteNumberAsClass implements UseCase<NumbersModel, Params> {
  final NumberRepoContract repository;

  GetConcreteNumberAsClass(this.repository);

  @override
  Future<Either<Failure, NumbersModel>> call(Params prams) async =>
      await repository.getConcreteNumberAsMethod(prams.number);
}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}
