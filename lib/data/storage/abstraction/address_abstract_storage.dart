import 'package:consulta_marcada/core/models/address.dart';

abstract class AddressAbstractStorage {
  Future<int> addAddress({Address address});
  Future<List<Map>> fetchAddressList();
}
