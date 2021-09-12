import 'package:dartz/dartz.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';

import '../../../../core/error/failure.dart';

abstract class NumberRepoContract {
  Future<Either<Failure, NumbersModel>> getConcreteNumberAsMethod(int number);
  Future<Either<Failure, NumbersModel>> getRandomNumberAsMethod();
}
