import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:sanear/app/domain/entities/orgao_model.dart';
import 'package:sanear/app/presentation/controllers/barrapesquisa_controller.dart';
import 'package:sanear/app/presentation/pages/orgao/orgao.dart';

import '../../sos/sos.dart';

class BarraDePesquisa extends StatefulWidget {
  const BarraDePesquisa({
    super.key,
  });

  @override
  State<BarraDePesquisa> createState() => _BarraDePesquisaState();
}

class _BarraDePesquisaState extends State<BarraDePesquisa> {
  BarraPesquisaController controller = BarraPesquisaController();

  List<String> sugestoes = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TypeAheadField<String>(
        textFieldConfiguration: TextFieldConfiguration(
          decoration: InputDecoration(
            hintText: "Pesquisar",
            suffixIcon: IconButton(
              onPressed: () {
                // Implemente a lógica aqui, se necessário
              },
              icon: Icon(Icons.search),
            ),
          ),
        ),
        suggestionsCallback: (pattern) async {
          if (pattern.isNotEmpty) {
            sugestoes = await controller.listarDados();
            return sugestoes.where((sugestao) =>
                sugestao.toLowerCase().contains(pattern.toLowerCase()));
          } else {
            return [];
          }
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            title: Text(suggestion),
          );
        },
        onSuggestionSelected: (String suggestion) async {
          var orgaoSelecionado = await controller.obterPorNome(suggestion);

          if (orgaoSelecionado != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Orgao(
                          orgao: orgaoSelecionado,
                        )));
          }
        },
      ),
    );
  }
}
