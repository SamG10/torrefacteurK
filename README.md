# Torrefacteur K

Ce projet est un petit jeu codé en Flutter permettant aux utilisateur de planter, récolter, assembler et stocké des plans de Kafé.

## Configuration Firebase

Avant de pouvoir exécuter l'application, vous devez configurer votre projet Firebase :

1. Créez un nouveau projet Firebase sur le [site officiel Firebase](https://console.firebase.google.com/).
2. Configurez votre application Flutter en suivant les étapes décrites dans la [documentation officielle de Firebase pour Flutter](https://firebase.flutter.dev/docs/overview/).
3. Activez l'authentification par e-mail/password dans l'onglet "Authentication" de votre projet Firebase.
4. Activez le service Cloud Storage dans l'onglet "Storage" de votre projet Firebase.
5. Installer le cli firebase : `npm install -g firebase-tools`
6. Executer la commande `flutterfire configure`

Assurez-vous d'obtenir les fichiers de configuration Firebase nécessaires (fichier `google-services.json` pour Android et fichier `GoogleService-Info.plist` pour iOS) et de les ajouter à votre projet Flutter conformément à la documentation Firebase.

## Installation

1. Clonez ce dépôt de code :
   `git clone https://github.com/SamG10/torrefacteurK.git`
4. Exécutez la commande suivante pour obtenir les dépendances :
   `flutter pub get`
6. Lancez l'application sur un émulateur ou un appareil connecté :
   `flutter run`