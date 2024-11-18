import 'package:flutter/material.dart';

class MeuDrawer extends StatelessWidget {
  const MeuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ThemeData().primaryColor,
            ),
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: const Text('Países'),
            onTap: () {
              //context.pushReplacement('/');
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: const Text('Paises'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/paises',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.place_outlined),
            title: const Text('Lugares'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/lugares',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: const Text('Adicionar Lugar'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/adicionar-lugar',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.engineering),
            title: const Text('Configurações'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/configuracoes',
              );
            },
          ),
        ],
      ),
    );
  }
}
