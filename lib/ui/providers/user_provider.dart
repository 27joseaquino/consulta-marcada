import 'package:consulta_marcada/core/models/user.dart';
import 'package:consulta_marcada/services/implementation/user_service.dart';
import 'package:consulta_marcada/services/service_response.dart';
import 'package:consulta_marcada/ui/providers/abstract_provider.dart';

class UserProvider extends AbstractProvider {
  final _userService = UserService();
  User _user;

  User get user => _user;

  Future<User> activeUser() async {
    this._user = await _userService.activeUser();

    return user;
  }

  Future<bool> signInWithEmailAndPassword({
    String email,
    String password,
  }) async {
    setIsProcessing(true);

    ServiceResponse<User> result =
        await _userService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    this._user = this.getDataFromService(result);

    setIsProcessing(false);

    return this._user != null;
  }

  void signOut() {
    setIsProcessing(true);

    _userService.signOut();

    _user = null;

    setIsProcessing(false);
  }
}
