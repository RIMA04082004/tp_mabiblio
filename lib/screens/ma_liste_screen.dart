import 'package:flutter/material.dart';
import '../data/livres_data.dart';

class MaListeScreen extends StatefulWidget {
  const MaListeScreen({super.key});

  @override
  State<MaListeScreen> createState() => _MaListeScreenState();
}

class _MaListeScreenState extends State<MaListeScreen> {
  bool _nouveautesSeulement = false;
    final Map<String, bool> _genres = {
    'Roman': true,
    'Science': true,
    'Histoire': true,
    'Jeunesse': true,
    'Informatique': true,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        title: const Text('Ma liste'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Builder(
                builder: (context) {
                  final livresAffiches = livres.where((livre) => _genres[livre.genre] == true).toList();
                  final livresLus = livresAffiches.where((livre) => livre.lu).length;
                  return Text(
                    'Lus : $livresLus / ${livresAffiches.length}',
                    style: const TextStyle(fontSize: 16),
                  );
                },
              ),
            ),
          ),
        ],
      ),
           body: ListView(
        children: [
                    CheckboxListTile(
            title: const Text('Tous les genres', style: TextStyle(fontWeight: FontWeight.bold)),
            tristate: true,
            value: _genres.values.every((v) => v)
                ? true
                : (_genres.values.every((v) => !v) ? false : null),
            onChanged: (bool? value) {
              setState(() {
                final nouvelleValeur = value ?? true;
                _genres.updateAll((key, val) => nouvelleValeur);
              });
            },
          ),
          const Divider(),
          ..._genres.keys.map((String genre) {
            final int nombreLivres = livres.where((l) => l.genre == genre).length;
            IconData icone = Icons.book;
            if (genre == 'Science') icone = Icons.science;
            if (genre == 'Informatique') icone = Icons.computer;
            if (genre == 'Histoire') icone = Icons.history_edu;
            if (genre == 'Jeunesse') icone = Icons.child_care;

            return CheckboxListTile(
              secondary: Icon(icone),
              title: Text(genre),
              subtitle: Text('$nombreLivres livres'),
              value: _genres[genre],
              activeColor: Colors.indigo,
              onChanged: (bool? value) {
                setState(() {
                  _genres[genre] = value ?? false;
                });
              },
            );
          }).toList(),
                    const Divider(thickness: 2),
          ...livres.where((livre) => _genres[livre.genre] == true).map((livre) {
            return CheckboxListTile(
              secondary: CircleAvatar(
                backgroundColor: livre.couleur,
                foregroundColor: Colors.white,
                child: Text(livre.titre[0].toUpperCase()),
              ),
              title: Text(
                livre.titre,
                style: TextStyle(
                  decoration: livre.lu ? TextDecoration.lineThrough : null,
                ),
              ),
              subtitle: Text('${livre.auteur} - ${livre.annee}'),
              value: livre.lu,
              onChanged: (bool? value) {
                setState(() {
                  livre.lu = value ?? false;
                });
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}