import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/home/domain/entities/city_entity.dart';

abstract class CitiesRepo {
  Future<Either<Failure, List<CityEntity>>> getCities();
}
