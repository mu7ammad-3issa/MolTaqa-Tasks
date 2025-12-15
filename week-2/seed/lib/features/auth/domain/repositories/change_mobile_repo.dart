import 'package:dartz/dartz.dart';
import 'package:seed/core/errors/failure.dart';
import 'package:seed/features/auth/domain/entities/change_mobile_response_entity.dart';

abstract class ChangeMobileRepo {
  Future<Either<Failure, ChangeMobileResponseEntity>> changeMobile({
    required String mobile,
  });
}
