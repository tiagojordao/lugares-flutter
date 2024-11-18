// ignore_for_file: file_names

import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Lugar> _lugar = [];

  List<Lugar> get favoritos => _lugar;

  void handleFavorite(Lugar lugar) {
    _lugar.contains(lugar) ? _lugar.remove(lugar) : _lugar.add(lugar);
    notifyListeners();
  }
}