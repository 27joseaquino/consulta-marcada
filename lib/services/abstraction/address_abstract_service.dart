import 'package:consulta_marcada/core/models/address.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';

class AddressAbstractService extends AbstractService {
  @override
  List responseToObjectList(List json) {
    List<Address> addressList = [];

    for (int i = 0; i < json.length; i++) {
      addressList.add(Address.fromJson(json[i]));
    }

    return addressList;
  }

  @override
  responseToObject(Map json) {
    Address address = Address.fromJson(json);

    return address;
  }
}
