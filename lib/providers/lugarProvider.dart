import 'package:f05_lugares_app/model/lugar.dart';
import 'package:flutter/material.dart';

class LugarProvider with ChangeNotifier{

  final List<Lugar> _lugares = [];

  List<Lugar> get lugares => _lugares;

  void addLugar(Lugar lugar) {
    _lugares.add(lugar);
    notifyListeners();
  }

  void removeLugar(Lugar lugar) {
    _lugares.remove(lugar);
    notifyListeners();
  }

}