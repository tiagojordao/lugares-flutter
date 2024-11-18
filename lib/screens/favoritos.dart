import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/providers/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosScreen extends StatelessWidget {
  final List<Lugar> lugaresFavoritos;
  const FavoritosScreen({super.key, required this.lugaresFavoritos});

  @override
  Widget build(BuildContext context) {

    final favoritePlaces = Provider.of<FavoriteProvider>(context).favoritos;

    if (favoritePlaces.isEmpty) {
      return const Center(
        child: Text('Nenhum Lugar Marcado como Favorito!', style: TextStyle(fontSize: 20),),
      );
    } else {
      return ListView.builder(
          itemCount: favoritePlaces.length,
          itemBuilder: (ctx, index) {
            return ItemLugar(lugar: favoritePlaces.elementAt(index),);
          });
    }
  }
}