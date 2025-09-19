import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  List<String> _contactNames = [];

  @override
  void initState() {
    super.initState();
    _loadNames(); // Ladda namnen när sidan skapas
  }

  Future<void> _loadNames() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> names = prefs.getStringList('contact_names') ?? [];
    setState(() {
      _contactNames = names;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Sparade kontakter:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Den här listan visar de sparade namnen
          Expanded(
            child: ListView.builder(
              itemCount: _contactNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_contactNames[index]),
                );
              },
            ),
          ),
          // Knapp för att gå tillbaka
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Gå tillbaka till startsidan'),
            ),
          ),
        ],
      ),
    );
  }
}