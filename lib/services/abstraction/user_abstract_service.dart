import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';

abstract class UserAbstractService extends AbstractService {
  @override
  User responseToObject(Map json) {
    User user = User.fromJson(json);

    return user;
  }

  @override
  List responseToObjectList(List json) {
    // ignore: todo
    // TODO: implement responseToObjectList
    throw UnimplementedError();
  }
}
