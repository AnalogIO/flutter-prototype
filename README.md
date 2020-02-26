# Café Analog app V2

Clip card app written in Dart/Flutter.

## Todos

This app is still in its exploration stage.

There are a few things that are nice to know before looking into the code:

- I'm new to Flutter. I hope the code is readable :)
- MobilePay needs to be implemented and tested as first priority
- The app is still being designed. The Login/registration and Tickets pages are the only ones that are implemented, and they are not implemented fully yet.
- Nothing is hooked up to a server yet. Logging in, creating an account, and spending a ticket will not work as a result. Tap the icon the the top-right corner (help or menu) to jump between the Login/registration and Tickets pages.
- When a reciept opens, the screen will increase brightness to full to make it more visible. When closing the reciept, it should return to the original brightness; this is currently bugged.
- Currently you 'spend' a ticket by tapping a ticket, followed by another tap after a short delay. This is done to prevent accidental activations. Could look into other ways to activate a ticket (read: swiping).

## Flutter: Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
