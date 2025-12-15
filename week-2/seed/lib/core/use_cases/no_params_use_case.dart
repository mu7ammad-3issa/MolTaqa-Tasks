import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';

abstract class NoParamsUseCase<T> {
  Future<Either<Failure, T>> call();
}

class NoParams {}
