import 'package:flutter_udemy/data/responses/responses.dart';
import 'package:flutter_udemy/domain/model.dart';
import 'package:flutter_udemy/app/extensions.dart';

// to convert the response into a non nullable object (model)

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orZero() ?? ZERO,
      this?.name?.orEmpty() ?? EMPTY,
      this?.numOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactsResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.email?.orEmpty() ?? EMPTY,
      this?.phone?.orEmpty() ?? EMPTY,
      this?.link?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer?.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}
