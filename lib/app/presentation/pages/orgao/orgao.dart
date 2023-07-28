import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/pages/sos/components/card_contato.dart';

import '../../../domain/entities/orgao_model.dart';

class Orgao extends StatelessWidget {
  final OrgaoModel orgao;

  Orgao({required this.orgao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Órgão'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orgao.orgao,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              orgao.funcao,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            CardContato(
                orgao: orgao.orgao,
                contato: orgao.contato,
                selecionar: () => {})
          ],
        ),
      ),
    );
  }
}
