import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';

class BarraPesquisaController {

  Future listarDados() async {
    final String response =
        await rootBundle.loadString('assets/json/pesquisa.json');
    log(response);

    Iterable lista = jsonDecode(response);
    return lista.toList();
    }

}