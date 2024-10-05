import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location/src/modules/history/controller/history_controller.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final HistoryController _controller = HistoryController();

  @override
  void initState() {
    super.initState();
    _controller
        .carregarHistorico(); // Carregar os dados históricos ao iniciar a página
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Histórico de Consultas'),
        backgroundColor: Colors.green, // Cor do AppBar
      ),
      body: Observer(
        builder: (_) {
          if (_controller.historicoEnderecos.isEmpty) {
            return const Center(
              child: Text('Nenhum histórico encontrado.'),
            );
          }

          return ListView.builder(
            itemCount: _controller.historicoEnderecos.length,
            itemBuilder: (context, index) {
              final endereco = _controller.historicoEnderecos[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4, // Adiciona sombra ao cartão
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(12), // Bordas arredondadas
                ),
                child: ListTile(
                  title: Text(
                    endereco,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight:
                              FontWeight.bold, // Deixar o texto em negrito
                        ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete,
                        color: Colors.red), // Ícone de deletar
                    onPressed: () {
                      // Chamar a função para remover o histórico
                      _controller.removerHistorico(index);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
