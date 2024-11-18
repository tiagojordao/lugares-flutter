// ignore_for_file: file_names

import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';

class PaisProvider with ChangeNotifier {
  final List<Pais> _paises = [];

  List<Pais> get paises => _paises;

  void addPais(Pais pais) {
    _paises.add(pais);
    notifyListeners();
  }

  void removePais(Pais pais) {
    _paises.remove(pais);
    notifyListeners();
  }

}