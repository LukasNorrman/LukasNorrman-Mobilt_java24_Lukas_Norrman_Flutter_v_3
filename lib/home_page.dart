import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();

  Future<void> _saveName() async {
    if (_nameController.text.isEmpty) {
      return; // Spara inte om textfältet är tomt
    }

    final prefs = await SharedPreferences.getInstance();

    // Hämta den befintliga listan med namn. Om den inte finns, skapa en tom lista.
    final List<String> names = prefs.getStringList('contact_names') ?? [];

    // Lägg till det nya namnet i listan
    names.add(_nameController.text);

    // Spara den uppdaterade listan i shared_preferences
    await prefs.setStringList('contact_names', names);

    // Rensa textfältet efter att namnet har sparats
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Bild från webben (UI-widget som använder URI/länk)
            Image.network(
              'https://images.unsplash.com/photo-1520923642038-b4259acecbd7?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHBob25lJTIwY2FsbHxlbnwwfHwwfHx8MA%3D%3D', // Exempel på en länk till en bild
              height: 200,
            ),
            const SizedBox(height: 20),

            // Textfält (UI-widget)
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Ange ett namn',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Knapp (UI-widget)
            ElevatedButton(
              onPressed: () async {
                await _saveName();
                Navigator.pushNamed(context, '/contactList');
              },
              child: const Text('Lägg till & Gå till lista'),
            ),
          ],
        ),
      ),
    );
  }
}