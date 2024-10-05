import 'package:flutter/material.dart';
import 'package:fast_location/src/modules/home/page/home_page.dart';
import 'package:fast_location/src/modules/history/page/history_page.dart';
import 'package:fast_location/src/shared/storage/storage_keys.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Inicializar o Hive para armazenamento local
  WidgetsFlutterBinding.ensureInitialized(); // Garante que o Flutter esteja totalmente inicializado antes de executar o código
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
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 16.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InitialPage(),
        '/home': (context) => HomePage(),
        '/historico': (context) => const HistoryPage(),
      },
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
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
