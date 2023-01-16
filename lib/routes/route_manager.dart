import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/notes_edit.dart';

class GenerateAllRoutes {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const Home());
      case '/notes_edit':
        return MaterialPageRoute(
            builder: (context) => NotesEdit(settings.arguments));
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Rota não encontrada'),
            ),
          ),
        );
    }
  }
}
