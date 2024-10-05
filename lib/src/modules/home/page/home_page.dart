import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location/src/modules/home/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fast Location'),
        backgroundColor: Colors.green, // Cor do AppBar
      ),
      body: SingleChildScrollView( // Adiciona o SingleChildScrollView aqui
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
            children: [
              const Icon(
                Icons.location_on, // Ícone de localização
                size: 60,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                'Faça uma busca para localizar seu destino',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Digite o CEP',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () async {
                  String cep = _cepController.text;
                  if (cep.isNotEmpty && cep.length == 8) {
                    await _controller.consultarCep(cep);
                    _cepController.clear(); // Limpa o campo de texto após a consulta
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, insira um CEP válido.')),
                    );
                  }
                },
                icon: const Icon(Icons.search), // Ícone no botão
                label: const Text('Localizar endereço'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // Botão maior
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Borda arredondada
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) {
                  return Column(
                    children: [
                      if (_controller.isLoading)
                        const CircularProgressIndicator()
                      else if (_controller.errorMessage != null)
                        Text(
                          _controller.errorMessage!,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else if (_controller.enderecoConsultado != null)
                        Text(
                          'Endereço: ${_controller.enderecoConsultado}',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      else
                        const Text('Nenhum endereço consultado ainda.'),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _controller.enderecoConsultado != null
                    ? () async {
                        await _controller.tracarRota();
                      }
                    : null,
                icon: const Icon(Icons.directions), // Ícone no botão
                label: const Text('Traçar Rota'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/historico');
                },
                icon: const Icon(Icons.history), // Ícone no botão
                label: const Text('Histórico de endereços'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
