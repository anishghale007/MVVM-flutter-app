import 'package:dartz/dartz.dart';
import 'package:flutter_udemy/app/functions.dart';
import 'package:flutter_udemy/data/network/failure.dart';
import 'package:flutter_udemy/data/request/request.dart';
import 'package:flutter_udemy/domain/model/model.dart';
import 'package:flutter_udemy/domain/repository/repository.dart';
import 'package:flutter_udemy/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  // this class contains the data that should be pass from the view model to our use case

  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();

    return _repository.login(LoginRequest(
      input.email,
      input.password,
      deviceInfo.identifier,
      deviceInfo.name,
    ));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
