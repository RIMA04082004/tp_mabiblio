  import 'package:flutter/material.dart';

  class ParametresScreen extends StatelessWidget {
    const ParametresScreen({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Paramètres')),
        body: ListView( 
          padding: const EdgeInsets.all(8),
          children: [
            
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Mon profil'),
              subtitle: const Text('Nom, e-mail, mot de passe'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profil sélectionné')),
                );
              },
            ),
            
            
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              tileColor: Colors.indigo.shade50,
              iconColor: Colors.indigo,
              textColor: Colors.indigo.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onTap: () {},
            ),
            
            
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('Langue'),
              subtitle: const Text('Français'),
            ),
            
            
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              // Test 2 : isThreeLine permet d'avoir un subtitle sur 2 lignes
              subtitle: const Text('Version 1.0\nDéveloppée dans le cadre du TP MaBiblio'),
              isThreeLine: true,
              
            ),
          ],
        ),
      );
    }
  }