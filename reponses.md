# Réponses – TP MaBiblio

## Partie 00
### Q0.8 
On ne les envoie pas car ce sont des dossiers générés automatiquement par Flutter quand on compile ou qu'on lance le projet et Ils sont très lourds 

### Question de réflexion
on doit faire des petits commits parce que ça permet de suivre l'évolution du projet étape par étape. Si on fait une erreur, on peut facilement revenir en arrière à un commit précis sans perdre tout le travail. 

---

## Partie 01
### Q1.2 
Avec le `onTap`, on voit un effet quand on clique sur la ligne, puis le SnackBar apparaît. Si on enlève le onTap on ne peut plus cliquer dessus, il n'y a plus d'effet visuel et le message ne s'affiche plus.

### Q1.4 – Effets de dense, isThreeLine et enabled
- `dense: true` : Rend la ligne plus petite. 
- `isThreeLine: true` : Agrandit la ligne pour permettre au sous-titre de s'afficher .
- `enabled: false` : Grise complètement la ligne. Le texte devient transparent, on ne peut plus cliquer dessus ca veut dire option desactive

### Question de réflexion
leading c'est le widget qu'on met tout à gauche et trailing c'est celui qu'on met tout à droite . Un ListTile doit être dans un parent avec une largeur limitée  parce qu'il prend toute la largeur disponible.
---

## Partie 02
### Q2.1 –
L'erreur est A RenderFlex overflowed by XXX pixels on the bottom. Ça arrive parce qu'on a mis beaucoup de ListTile dans une Column.

### Q2.5 
ListView.builder est mieux car il fait du il ne construit que les éléments visibles à l'écran. Avec ListView(children: ...), Flutter crée les 1000 livres d'un coup en mémoire. Avec .builder, il ne crée que les lignes qu'on voit.

### Q2.8
 La ListView verticale veut prendre toute la place, mais comme elle reçoit une hauteur infinie, elle ne sait pas où s'arrêter. 

## Partie 03
### Q3.1
Parce que l'écran va changer d'état quand l'utilisateur coche ou décoche des cases. 

### Q3.2
Si on oublie `setState`, la variable change en mémoire, mais l'écran ne se met pas à jour. La case à cocher ne se cochera pas visuellement, l'utilisateur croira que le clic n'a pas marché.


## Partie 04
### Q4.3 
color change la couleur de fond de la carte. surfaceTintColor ajoute une teinte par-dessus la couleur de fond , ça permet de voir l'élévation de la carte.

### Q4.5
Parce qu'on a mis des bords arrondis sur la Card. Si on ne met pas le clipBehavior, l'effet d'encre  quand on clique va déborder des coins arrondis. Avec le clip, l'encre est bien coupée et respecte les bords de la carte.

### Q4.8 
Parce que quand on clique sur les boutons "Favoris" ou "Lu", on modifie l'état du livre . Il faut donc un StatefulWidget avec setState pour que l'icône change .

## Partie 05

### Q5.2 
Pour une grille verticale, l'axe principal  c'est l'axe de haut en bas (celui dans lequel on scrolle). L'axe secondaire  c'est l'axe de gauche à droite . Du coup, mainAxisSpacing c'est l'espace entre les lignes, et crossAxisSpacing c'est l'espace entre les colonnes.

### Q5.3 
C'est le ratio 0.7. Comme la formule c'est Largeur / Hauteur, un chiffre inférieur à 1 veut dire que la case est plus haute que large. Ça fait exactement la forme d'un livre.

### Q5.6 
Avec GridView.count on choisit un nombre de colonnes fixe . Avec GridView.extent, on donne une largeur maximale pour chaque case  et Flutter calcule tout seul combien de colonnes peuvent rentrer dans l'écran. Si on redimensionne la fenêtre avec extent, le nombre de colonnes change automatiquement, ce qui n'est pas le cas avec count.

### Question de réflexion
L'inconvénient de GridView.count et extent quand on a beaucoup d'éléments, c'est que Flutter va charger TOUS les éléments d'un coup en mémoire. Si on a 1000 livres, l'application va ramer et risque de planter. Pour éviter ça, il faudra utiliser GridView.builder à la Partie 06.