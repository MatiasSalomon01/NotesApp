import 'package:flutter/material.dart';
import 'package:notes_app/layouts/layouts.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MainLayoutProvider(platform),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoService(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: const MainLayout(),
      scaffoldMessengerKey: NotificationService.messengerKey,
    );
  }
}
