
# Project Title

Le script Bash que nous avons développé est un outil utile pour les administrateurs système qui souhaitent ajouter un nouvel utilisateur avec des privilèges sudo. Le script permet de choisir entre deux options de configuration sudo : un accès complet à toutes les commandes ou un accès limité à des commandes spécifiques. Le script vérifie également la syntaxe du fichier sudoers avant d'appliquer les modifications, et enregistre les changements dans un fichier journal pour une meilleure traçabilité.

Points clés :     
* Vérification des privilèges d'administration : le script vérifie que l'utilisateur exécute le script en tant que root.
* Ajout d'un utilisateur : le script permet à l'administrateur de saisir le nom d'utilisateur à ajouter
* Sélection de la configuration sudo : le script propose deux options de configuration sudo pour l'utilisateur ajouté - accès complet ou accès limité à des commandes spécifiques.
* Vérification de la syntaxe du fichier sudoers : le script vérifie que la syntaxe du fichier sudoers est correcte avant d'appliquer les modifications.
* Journalisation des modifications : le script enregistre les modifications apportées au fichier sudoers dans un fichier journal pour une meilleure traçabilité

Ce script est donc un outil utile pour les administrateurs système qui cherchent à automatiser l'ajout d'utilisateurs avec des privilèges sudo, tout en assurant la sécurité et la traçabilité des modifications apportées au fichier sudoers.

