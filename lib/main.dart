import 'package:clean_architecture_tdd_course/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple.shade800,
        accentColor: Colors.purple.shade600,
      ),
      home: const NumberTriviaPage(),
    );
  }
}
