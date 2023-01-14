import 'package:dartz/dartz.dart';
import 'package:flutter_udemy/data/network/failure.dart';
import 'package:flutter_udemy/data/request/request.dart';
import 'package:flutter_udemy/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
