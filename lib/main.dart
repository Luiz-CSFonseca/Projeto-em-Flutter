import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:fast_location/src/modules/history/page/history_page.dart';
import 'package:fast_location/src/shared/storage/storage_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Inicializar o Hive para armazenamento local
  await Hive.initFlutter();
  await Hive.openBox<String>(StorageKeys.historicoBox);

  runApp(FastLocationApp());
}

class FastLocationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(
  primarySwatch: Colors.green,  // Muda o esquema de cores para verde
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold), // Estilo de título
    bodyText1: TextStyle(fontSize: 16.0), // Estilo de texto comum
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Botões com fundo verde
    ),
  ),
),
      // Configuração das rotas
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),  // Tela de inicialização
        '/home': (context) => HomePage(), // Página principal (consulta de CEP)
        '/historico': (context) => const HistoryPage(), // Página de histórico
      },
    );
  }
}

// Classe para a página inicial (tela de carregamento)
class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    // Simula o carregamento e redireciona para a página Home após 2 segundos
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Carregando...'),
          ],
        ),
      ),
    );
  }
}
