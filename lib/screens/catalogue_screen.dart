import 'package:flutter/material.dart';
import '../data/livres_data.dart';
import '../models/livre.dart'; 
import '../widgets/livre_card.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalogue')),
      
                 body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Nouveautés', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                for (var livre in livres.where((l) => l.nouveaute))
                                    Container(
                    width: 110,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      // On enlève la couleur du livre, on met du blanc (ou un gris très clair)
                      color: Colors.grey.shade200, 
                      borderRadius: BorderRadius.circular(12),
                      // On ajoute une petite bordure noire pour bien délimiter
                      border: Border.all(color: Colors.black, width: 1), 
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      livre.titre, 
                      textAlign: TextAlign.center, 
                      // On met le texte en noir et en gras
                      style: const TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Tout le catalogue', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          
          
            Expanded(
            child: ListView.builder(
              itemCount: livres.length,
              itemBuilder: (context, index) {
                return LivreCard(livre: livres[index]);
              },
            ),
          ),
        ],
      ),
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