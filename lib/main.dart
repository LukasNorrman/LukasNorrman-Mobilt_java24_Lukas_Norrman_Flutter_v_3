import 'package:flutter/material.dart';
import 'home_page.dart'; // Importera din första sida
import 'contact_list_page.dart'; // Importera din andra sida

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Min Flutter-app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      // Ställ in Named Routes här
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Hem'),
        '/contactList': (context) => const ContactListPage(title: 'Kontaktlista'),
      },
    );
  }
}