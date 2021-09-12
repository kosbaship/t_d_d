import 'package:dartz/dartz.dart';
import 'package:numbers/features/numbers/domain/entities/numbers_model.dart';

import '../../../../core/error/failure.dart';

/// One: Create this contract with all the user cases we have
/// here We have Either which is function programming concept
/// and the two returned objects for success and error
abstract class NumberRepoContract {
  Future<Either<Failure, NumbersModel>> getConcreteNumberAsMethod(int number);
  Future<Either<Failure, NumbersModel>> getRandomNumberAsMethod();
}
