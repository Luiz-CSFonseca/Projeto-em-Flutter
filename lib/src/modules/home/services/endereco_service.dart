import '../repository/endereco_repository.dart';
import '../repository/local_storage_repository.dart';
import '../model/endereco_model.dart';

class EnderecoService {
  final EnderecoRepository enderecoRepository = EnderecoRepository();
  final LocalStorageRepository localStorageRepository = LocalStorageRepository();

  // Buscar CEP e salvar no armazenamento local
  Future<EnderecoModel?> buscarEndereco(String cep) async {
    EnderecoModel? endereco = await enderecoRepository.buscarPorCep(cep);
    if (endereco != null) {
      await localStorageRepository.salvarEndereco(endereco);
    }
    return endereco;
  }

  // Buscar histórico de endereços
  Future<List<EnderecoModel>> buscarHistorico() async {
    return await localStorageRepository.buscarHistorico();
  }
}
