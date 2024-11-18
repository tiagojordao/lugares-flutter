// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/providers/lugarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugaresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lugaresProvider = Provider.of<LugarProvider>(context);
    final lugares = lugaresProvider.lugares;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lugares",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      drawer: MeuDrawer(),
      body: lugares.isEmpty
          ? const Center(
              child: Text('Nenhum lugar cadastrado ainda.'),
            )
          : ListView.builder(
              itemCount: lugares.length,
              itemBuilder: (context, index) {
                final lugar = lugares[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Image.network(
                      lugar.imagemUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(lugar.titulo),
                    subtitle: Text('Países: ${lugar.paises.join(', ')}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        lugaresProvider.removeLugar(lugar);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${lugar.titulo} removido com sucesso!'),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
