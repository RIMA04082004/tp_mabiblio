import 'package:flutter/material.dart';
import '../models/livre.dart';
import '../screens/detail_screen.dart';

class LivreCard extends StatelessWidget {
  final Livre livre;

  const LivreCard({super.key, required this.livre});

  @override
  Widget build(BuildContext context) {
        return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      surfaceTintColor: Colors.blue.shade100,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailScreen(livre: livre)),
          );
        },
      child: ListTile(
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
      ),
      ),
    );
  }
}