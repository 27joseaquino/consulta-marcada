class ServiceResponse<T> {
  T _data;
  String _error;

  T get data => _data;
  String get error => _error;

  set setData(T newData) {
    _data = newData;
  }

  set setError(String newError) {
    _error = newError;
  }
}
