import 'package:mobx/mobx.dart';
import 'package:hive/hive.dart';
import 'package:fast_location/src/shared/storage/storage_keys.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  final Box<String> _historicoBox = Hive.box<String>(StorageKeys.historicoBox);

  @observable
  ObservableList<String> historicoEnderecos = ObservableList<String>();

  // Função para carregar o histórico armazenado
  @action
  void carregarHistorico() {
    historicoEnderecos = ObservableList<String>.of(_historicoBox.values.toList());
  }

  // Função para remover um item do histórico
  @action
  void removerHistorico(int index) {
    // Remove o endereço do Hive e da lista observável
    _historicoBox.deleteAt(index);
    historicoEnderecos.removeAt(index);
  }

  // Função para limpar todo o histórico (se precisar no futuro)
  @action
  void limparHistorico() {
    _historicoBox.clear();
    historicoEnderecos.clear();
  }
}

