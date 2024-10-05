import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:fast_location/src/shared/storage/storage_keys.dart';
import 'package:map_launcher/map_launcher.dart'; // Adicionar o pacote map_launcher
import 'package:geocoding/geocoding.dart'; // Para converter o endereço em coordenadas

class HomeService {
  final Dio dio;

  HomeService(this.dio);

  Future<String?> consultarCep(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      if (response.statusCode == 200 && response.data != null) {
        String endereco = '${response.data['logradouro']}, ${response.data['bairro']}, ${response.data['localidade']}, ${response.data['uf']}';

        // Salvar no histórico (armazenamento local)
        await _salvarNoHistorico(endereco);

        return endereco;
      }
    } catch (e) {
      print('Erro ao consultar CEP: $e');
      return null;
    }
  }

  Future<void> _salvarNoHistorico(String endereco) async {
    var box = await Hive.openBox<String>(StorageKeys.historicoBox);
    await box.add(endereco);
  }

  // Método para traçar a rota
  Future<void> tracarRota(String endereco) async {
  try {
    // Converte o endereço em coordenadas (latitude e longitude)
    List<Location> locations = await locationFromAddress(endereco);

    // Verifica se o retorno não é nulo e se contém coordenadas
    if (locations.isNotEmpty) {
      final location = locations.first;

      // Abre o Google Maps com as coordenadas
      await MapLauncher.showDirections(
        mapType: MapType.google,
        destination: Coords(location.latitude, location.longitude),
        destinationTitle: endereco,
      );
    } else {
      print('Nenhuma coordenada encontrada para o endereço.');
    }
  } catch (e) {
    print('Erro ao traçar rota: $e');
  }
}
}
