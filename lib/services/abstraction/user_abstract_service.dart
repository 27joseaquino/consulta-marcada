import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

abstract class UserAbstractService extends AbstractService {
  Future<User> activeUser();
  void signOut();
  Future<ServiceResponse<User>> signInWithEmailAndPassword({
    String email,
    String password,
  });

  @override
  User responseToObject(Map json) {
    User user = User.fromJson(json);

    return user;
  }

  @override
  List responseToObjectList(List json) {
    List<User> users = [];

    for (int i = 0; i < json.length; i++) {
      users.add(User.fromJson(json[i]));
    }

    return users;
  }
}
