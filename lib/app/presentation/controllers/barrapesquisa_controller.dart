import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

import '../../domain/entities/orgao_model.dart';

class BarraPesquisaController {
  Future<List<String>> listarDados() async {
    final String response =
        await rootBundle.loadString('assets/json/pesquisa.json');
    log(response);

    List<dynamic> lista = jsonDecode(response);
    List<String> sugestoes =
        lista.map((item) => item["orgao"] as String).toList();

    return sugestoes;
  }

  Future<OrgaoModel?> obterPorNome(String nome) async {
    final String response =
        await rootBundle.loadString('assets/json/pesquisa.json');

    Iterable lista = jsonDecode(response);

    List<OrgaoModel> dados =
        lista.map((model) => OrgaoModel.fromMap(model)).toList();

    for (OrgaoModel orgao in dados) {
      if (orgao.orgao == nome) {
        return orgao;
      }
    }

    return null;
  }
}
