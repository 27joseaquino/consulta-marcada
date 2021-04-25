treatUsername(String name) {
  if (name == null || name.isEmpty) {
    return '';
  } else if (name.split(' ').length < 2) {
    return name.split(' ')[0];
  }

  String firstName = name.split(' ')[0];
  String secondName = name.split(' ')[1];

  return '$firstName $secondName';
}
