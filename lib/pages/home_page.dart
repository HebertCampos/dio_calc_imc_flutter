import 'package:dio_calc_imc_flutter/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

import '../models/imc_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  var imcRepository = ImcRepository();
  List<IMC> _listaIMCs = [];

  @override
  void initState() {
    super.initState();
    _carregarIMCs();
  }

  Future<void> _carregarIMCs() async {
    _listaIMCs = await imcRepository.listarIMCs();
    setState(() {});
  }

  void _salvarIMC() async {
    String nome = nomeController.text;
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);

    await imcRepository.adicionarIMC(
      IMC(nome: nome, peso: peso, altura: altura),
    );

    nomeController.text = '';
    pesoController.text = '';
    alturaController.text = '';
    
    _listaIMCs = await imcRepository.listarIMCs();
    setState(() {});
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: _listaIMCs.length,
          itemBuilder: (context, index) {
            var imc = _listaIMCs[index];
            double valorIMC = imc.calculoIMC();
            return Card(
              child: ListTile(
                title: Text(imc.getNome()),
                subtitle: Row(
                  children: [
                    Text("Peso: ${imc.getPeso()}"),
                    SizedBox(width: 8),
                    Text("Altura: ${imc.getAltura()}"),
                    Text(' = IMC: ${valorIMC.toStringAsFixed(2)} '),
                    Text(imc.classificacaoIMC(valorIMC: valorIMC)),
                  ],
                ),
              ),
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              title: const Text('Adicionar novo IMC'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  TextField(
                    controller: pesoController,
                    decoration: InputDecoration(
                      labelText: 'Peso',
                    ),
                  ),
                  TextField(
                    controller: alturaController,
                    decoration: InputDecoration(
                      labelText: 'Altura',
                      hintText: 'Informa altura em centrímetros',
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                TextButton(
                  onPressed: _salvarIMC,
                  child: Text('Salvar'),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}