import 'package:flutter/material.dart';

class BarraDePesquisa extends StatelessWidget {
  const BarraDePesquisa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: const TextField(
        decoration: InputDecoration(
            suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.search)),
            hintText: "Pesquisar"),
      ),
    );
  }
}
