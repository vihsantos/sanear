import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import '../../data/models/sos_model.dart';

class SosController {
  Future<List<SosModel>> buscarSosModel() async {
    final String response =
        await rootBundle.loadString('assets/json/dados_sos.json');
    log(response);

    Iterable lista = jsonDecode(response);

    List<SosModel> dados =
        lista.map((model) => SosModel.fromMap(model)).toList();

    return dados;
  }
}
