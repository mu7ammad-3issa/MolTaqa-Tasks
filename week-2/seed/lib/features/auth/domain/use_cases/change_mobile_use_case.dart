import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/core/use_cases/use_case.dart';
import 'package:seed/features/auth/domain/entities/change_mobile_response_entity.dart';
import 'package:seed/features/auth/domain/repositories/change_mobile_repo.dart';

class ChangeMobileUseCase extends UseCase<ChangeMobileResponseEntity, String> {
  final ChangeMobileRepo changeMobileRepo;

  ChangeMobileUseCase(this.changeMobileRepo);

  @override
  Future<Either<Failure, ChangeMobileResponseEntity>> call(
    String mobile,
  ) async {
    return await changeMobileRepo.changeMobile(mobile: mobile);
  }
}
