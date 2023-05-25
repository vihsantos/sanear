// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SosModel {
  final String orgao;
  final String situacao;
  final String contato;

  SosModel(this.orgao, this.situacao, this.contato);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orgao': orgao,
      'situacao': situacao,
      'contato': contato,
    };
  }

  factory SosModel.fromMap(Map<String, dynamic> map) {
    return SosModel(
      map['orgao'] as String,
      map['situacao'] as String,
      map['contato'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SosModel.fromJson(String source) =>
      SosModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
