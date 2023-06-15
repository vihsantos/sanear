import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/controllers/barrapesquisa_controller.dart';

class BarraDePesquisa extends StatefulWidget {
  const BarraDePesquisa({
    super.key,
  });

  @override
  State<BarraDePesquisa> createState() => _BarraDePesquisaState();
}

class _BarraDePesquisaState extends State<BarraDePesquisa> {
  BarraPesquisaController controller = BarraPesquisaController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: (){
              controller.listarDados();
            }, icon: Icon(Icons.search)),
            hintText: "Pesquisar"),
      ),
    );
  }
}
