import 'package:hive/hive.dart';
import '../model/endereco_model.dart';

class LocalStorageRepository {
  final String boxName = 'enderecos';

  // Abrir o box do Hive
  Future<Box> openBox() async {
    return await Hive.openBox(boxName);
  }

  // Salvar endereço no Hive
  Future<void> salvarEndereco(EnderecoModel endereco) async {
    var box = await openBox();
    box.add(endereco.toJson());  // Armazena o endereço como JSON
  }

  // Buscar todos os endereços armazenados
  Future<List<EnderecoModel>> buscarHistorico() async {
    var box = await openBox();
    return box.values.map((json) => EnderecoModel.fromJson(json)).toList();
  }
}
