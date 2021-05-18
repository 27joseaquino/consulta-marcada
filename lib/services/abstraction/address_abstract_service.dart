import 'package:consulta_marcada/core/models/address.dart';
import 'package:consulta_marcada/services/abstraction/abstract_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

abstract class AddressAbstractService extends AbstractService {
  Future<ServiceResponse<bool>> addAddress({String patientCPF, int cep});
  Future<ServiceResponse<List<Address>>> fetchAddressList();

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
