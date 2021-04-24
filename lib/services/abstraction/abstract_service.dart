abstract class AbstractService<T> {
  T responseToObject(Map json);
  List<T> responseToObjectList(List json);
}
