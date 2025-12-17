import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/use_case.dart';
import 'package:seed/features/home/domain/entities/advertisement_entity.dart';
import 'package:seed/features/home/domain/repositories/advertisements_repo.dart';

class GetAdvertisementsUseCase
    extends UseCase<List<AdvertisementEntity>, int?> {
  final AdvertisementsRepo advertisementsRepo;

  GetAdvertisementsUseCase(this.advertisementsRepo);

  @override
  Future<Either<Failure, List<AdvertisementEntity>>> call(int? cityId) async {
    return await advertisementsRepo.getAdvertisements(cityId: cityId);
  }
}
