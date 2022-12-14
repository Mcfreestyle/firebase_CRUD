import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session8_api/pages/home_page.dart';
import 'package:session8_api/pages/event_page.dart';
import 'package:session8_api/services/event_service.dart';

void main() {
  runApp(const ProviderStateWidget());
}

class ProviderStateWidget extends StatelessWidget {
  const ProviderStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => EventService(),
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
        title: 'Flutter Demo',
        theme: ThemeData(
          // useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home_page',
        routes: {
          'home_page': (_) => const HomePage(),
          'event_page': (_) => const EventPage(),
        });
  }
}
