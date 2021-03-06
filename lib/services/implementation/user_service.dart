import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/data/storage/implementation/user_storage.dart';
import 'package:consulta_marcada/services/abstraction/user_abstract_service.dart';
import 'package:consulta_marcada/services/implementation/shared_preferences_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

class UserService extends UserAbstractService {
  @override
  Future<User> activeUser() async {
    User user = await SharedPreferencesService().activeUser();
    return user;
  }

  @override
  void signOut() => SharedPreferencesService().clearUserPrefs();

  @override
  Future<ServiceResponse<User>> signInWithEmailAndPassword({
    String email,
    String password,
  }) async {
    ServiceResponse<User> result = ServiceResponse<User>();
    try {
      List<Map> response = await UserStorage().signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      SharedPreferencesService().saveUserPrefs(response[0]);

      result.setData = this.responseToObject(response[0]);
    } catch (e) {
      result.setError = "Esse usuário não existe!";
    }

    return result;
  }
}
