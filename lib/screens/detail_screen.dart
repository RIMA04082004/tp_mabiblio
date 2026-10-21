import 'package:flutter/material.dart';
import '../models/livre.dart';

class DetailScreen extends StatefulWidget {
  final Livre livre;

  const DetailScreen({super.key, required this.livre});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détail')),
      body: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: widget.livre.couleur,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16),
              child: Text(
                widget.livre.titre,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Auteur'),
              subtitle: Text(widget.livre.auteur),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Année'),
              subtitle: Text('${widget.livre.annee}'),
            ),
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Genre'),
              subtitle: Text(widget.livre.genre),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OverflowBar(
                alignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      setState(() {
                        widget.livre.favori = !widget.livre.favori;
                      });
                    },
                    icon: Icon(widget.livre.favori ? Icons.favorite : Icons.favorite_border),
                    label: const Text('Favoris'),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        widget.livre.lu = !widget.livre.lu;
                      });
                    },
                    icon: Icon(widget.livre.lu ? Icons.check_circle : Icons.check),
                    label: const Text('Lu'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}