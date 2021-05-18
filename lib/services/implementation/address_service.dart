import 'package:consulta_marcada/core/models/address.dart';
import 'package:consulta_marcada/data/api/address_api.dart';
import 'package:consulta_marcada/data/storage/implementation/address_storage.dart';
import 'package:consulta_marcada/services/abstraction/address_abstract_service.dart';
import 'package:consulta_marcada/services/service_response.dart';

class AddressService extends AddressAbstractService {
  @override
  Future<ServiceResponse<List<Address>>> fetchAddressList() async {
    ServiceResponse<List<Address>> result = ServiceResponse<List<Address>>();
    try {
      List<Map> response = await AddressStorage().fetchAddressList();

      result.setData = this.responseToObjectList(response);
    } catch (e) {
      print(e.toString());
      result.setError = "Ocorreu um erro.";
    }

    return result;
  }

  @override
  Future<ServiceResponse<bool>> addAddress({String patientCPF, int cep}) async {
    ServiceResponse<bool> result = ServiceResponse<bool>();
    try {
      Map map = await AddressApi().get(cep: cep);

      Address address = Address(
        patientCPF,
        map["cep"],
        map["logradouro"],
        map["bairro"],
        map["localidade"],
        map["uf"],
      );

      print(address.id);

      int response = await AddressStorage().addAddress(address: address);

      result.setData = response != null;
    } catch (e) {
      result.setError = "O CEP inserido não existe. Por favor, " +
          "tente novamente com um CEP válido!";
    }

    return result;
  }
}
