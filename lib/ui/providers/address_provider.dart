import 'package:consulta_marcada/core/models/address.dart';
import 'package:consulta_marcada/services/implementation/address_service.dart';
import 'package:consulta_marcada/services/service_response.dart';
import 'package:consulta_marcada/ui/providers/abstract_provider.dart';

class AddressProvider extends AbstractProvider {
  final _addressService = AddressService();
  List<Address> _addressList;

  List<Address> get addressList => _addressList;

  void fetchAddressList() async {
    setIsProcessing(true);

    ServiceResponse<List<Address>> result =
        await _addressService.fetchAddressList();

    _addressList = this.getDataFromService(result);

    setIsProcessing(false);
  }

  Future<bool> addAddress({String patientCPF, int cep}) async {
    setIsProcessing(true);

    ServiceResponse<bool> result = await _addressService.addAddress(
      patientCPF: patientCPF,
      cep: cep,
    );

    if (result.error != null) {
      setError(result.error);
    }

    fetchAddressList();

    setIsProcessing(false);

    return result.data;
  }
}
