import 'package:dartz/dartz.dart';
import 'package:flutter_udemy/app/functions.dart';
import 'package:flutter_udemy/data/network/failure.dart';
import 'package:flutter_udemy/data/request/request.dart';
import 'package:flutter_udemy/domain/model/model.dart';
import 'package:flutter_udemy/domain/repository/repository.dart';
import 'package:flutter_udemy/domain/usecase/base_usecase.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
  // this class contains the data that should be pass from the view model to our use case

  Repository _repository;
  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return _repository.register(RegisterRequest(
      input.countryMobileCode,
      input.userName,
      input.email,
      input.password,
      input.mobileNumber,
      input.profilePicture,
    ));
  }
}

class RegisterUseCaseInput {
  String countryMobileCode;
  String userName;
  String email;
  String password;
  String mobileNumber;
  String profilePicture;

  RegisterUseCaseInput(this.countryMobileCode, this.userName, this.email,
      this.password, this.mobileNumber, this.profilePicture);
}
