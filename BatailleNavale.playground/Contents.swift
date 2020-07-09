/*
 
 Cette Bataille Navale est un jeu à un joueur. Le but de ce jeu est de trouver l’emplacement de chaque navire dans une flotte. Le jeu est composé d’une grille de taille variable représentant une portion de mer divisée en cellules carrées. Au sein de cette grille, est cachée une flotte composée de :
 1 Croiseur de taille 4
 2 Escorteurs de taille 3
 3 Torpilleurs de taille 2
 4 Sous-marins de taille 1
 
 Règles pour la placement de la flotte
 — Chaque navire occupe des cellules contiguës sur la grille.
 — Les navires sont positionnés soit horizontalement, soit verticalement.
 — Les navires ne peuvent pas se toucher (même en diagonale).
 
 L’exercice consiste à positionner la flotte de manière aléatoire au sein de la grille tout en respectant les règles de positionnement énoncées.
 Le programme doit proposer une visualisation du résultat.
 
 */

let game = Game(gameSize: 8)
game.display()

BoatTests.defaultTestSuite.run()
CaseTests.defaultTestSuite.run()
OrientationTests.defaultTestSuite.run()
PlacementErrorTests.defaultTestSuite.run()
PlacementRulesTests.defaultTestSuite.run()
