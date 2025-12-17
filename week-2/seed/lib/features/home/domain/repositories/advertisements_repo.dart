import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';

abstract class AdvertisementsRepo {
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements({
    int? cityId,
  });
}
