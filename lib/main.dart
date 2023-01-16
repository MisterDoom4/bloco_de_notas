import 'package:flutter/material.dart';
import 'routes/route_manager.dart';

void main() {
  runApp(const AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/',
      onGenerateRoute: GenerateAllRoutes.generateRoute,
    );
  }
}
