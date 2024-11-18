// ignore_for_file: prefer_const_constructors

import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/providers/favoriteProvider.dart';
import 'package:f05_lugares_app/providers/lugarProvider.dart';
import 'package:f05_lugares_app/providers/paisesProvider.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/cadastrarLugar.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugares.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:f05_lugares_app/screens/pais_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LugarProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider(create: (context) => PaisProvider()),
      ],
      child: MeuApp()
    ));
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() => _MeuAppState();
}

class _MeuAppState extends State<MeuApp> {
  final List<Lugar> _lugaresFavoritos = [];

  void toggleLugarFavorito(Lugar place) {
    setState(() {
      _lugaresFavoritos.contains(place)
          ? _lugaresFavoritos.remove(place)
          : _lugaresFavoritos.add(place);
    });
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => MinhasAbas(listaFavoritos: _lugaresFavoritos,),
        '/lugaresPorPais': (ctx) => LugarPorPaisScreen(),
        '/detalheLugar': (ctx) => DetalhesLugarScreen(onToggle: toggleLugarFavorito),
        '/configuracoes': (ctx) => ConfigracoesScreen(),
        '/adicionar-lugar': (ctx) => CadastroLugarPage(),
        '/lugares': (ctx) => LugaresPage(),
        '/paises': (ctx) => PaisScreen()
      },
    );

    /* return MaterialApp.router(
      routerConfig: minhasRotas.getRouter(),
    ); */
  }
}
