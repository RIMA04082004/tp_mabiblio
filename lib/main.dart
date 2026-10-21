import 'package:flutter/material.dart';
import 'models/livre.dart';
import 'data/livres_data.dart';
import 'screens/catalogue_screen.dart';

void main() {
  runApp(const MaBiblioApp());
}

class MaBiblioApp extends StatelessWidget {
  const MaBiblioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaBiblio',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const CatalogueScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaBiblio'),
      ),
      body: const Center(child: Text('Bienvenue dans MaBiblio')),
    );
  }
}

Widget livreTile(Livre livre) {
  return ListTile(
    leading: CircleAvatar(
      backgroundColor: livre.couleur,
      foregroundColor: Colors.white,
      child: Text(livre.titre[0].toUpperCase()),
    ),
    title: Text(livre.titre),
    subtitle: Text('${livre.auteur} – ${livre.annee}'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(livre.note.toStringAsFixed(1)),
        const SizedBox(width: 4),
        const Icon(Icons.star, color: Colors.amber, size: 20),
      ],
    ),
  );
}