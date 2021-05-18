abstract class UserAbstractStorage {
  Future<List<Map>> signInWithEmailAndPassword({String email, String password});
}
