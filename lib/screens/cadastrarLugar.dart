// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/providers/lugarProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CadastroLugarPage extends StatefulWidget {
  @override
  _CadastroLugarPageState createState() => _CadastroLugarPageState();
}

class _CadastroLugarPageState extends State<CadastroLugarPage> {
  final _formKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();
  final _imagemUrlController = TextEditingController();
  final _avaliacaoController = TextEditingController();
  final _custoMedioController = TextEditingController();
  final _paisesController = TextEditingController();
  final _recomendacoesController = TextEditingController();

  void _salvarLugar() {
    if (_formKey.currentState!.validate()) {
      final lugar = Lugar(
        id: DateTime.now().toString(),
        titulo: _tituloController.text,
        imagemUrl: 'https://www.infoescola.com/wp-content/uploads/2009/03/estatua-da-liberdade.jpg',
        avaliacao: double.tryParse(_avaliacaoController.text) ?? 0.0,
        custoMedio: double.tryParse(_custoMedioController.text) ?? 0.0,
        paises: _paisesController.text.split(',').map((e) => e.trim()).toList(),
        recomendacoes: _recomendacoesController.text
            .split(',')
            .map((e) => e.trim())
            .toList(),
      );

      Provider.of<LugarProvider>(context, listen: false).addLugar(lugar);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lugar cadastrado com sucesso!')),
      );

      _formKey.currentState!.reset();
      _tituloController.clear();
      _imagemUrlController.clear();
      _avaliacaoController.clear();
      _custoMedioController.clear();
      _paisesController.clear();
      _recomendacoesController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastro de Lugar",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      drawer: MeuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _imagemUrlController,
                  decoration:
                      const InputDecoration(labelText: 'URL da Imagem'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a URL da imagem.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _avaliacaoController,
                  decoration: const InputDecoration(labelText: 'Avaliação'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a avaliação.';
                    }
                    final avaliacao = double.tryParse(value);
                    if (avaliacao == null || avaliacao < 0 || avaliacao > 5) {
                      return 'A avaliação deve ser entre 0 e 5.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _custoMedioController,
                  decoration:
                      const InputDecoration(labelText: 'Custo Médio (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o custo médio.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Insira um número válido.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _paisesController,
                  decoration: const InputDecoration(
                      labelText: 'Países (separados por vírgulas)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira pelo menos um país.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _recomendacoesController,
                  decoration: const InputDecoration(
                      labelText: 'Recomendações (separadas por vírgulas)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira pelo menos uma recomendação.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _salvarLugar,
                    child: const Text('Salvar Lugar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
