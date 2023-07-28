// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrgaoModel {
  final String orgao;
  final String funcao;
  final String contato;

  OrgaoModel(
    this.orgao,
    this.funcao,
    this.contato,
  );

  OrgaoModel copyWith({
    String? orgao,
    String? funcao,
    String? contato,
  }) {
    return OrgaoModel(
      orgao ?? this.orgao,
      funcao ?? this.funcao,
      contato ?? this.contato,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orgao': orgao,
      'funcao': funcao,
      'contato': contato,
    };
  }

  factory OrgaoModel.fromMap(Map<String, dynamic> map) {
    return OrgaoModel(
      map['orgao'] as String,
      map['funcao'] as String,
      map['contato'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrgaoModel.fromJson(String source) =>
      OrgaoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OrgaoModel(orgao: $orgao, funcao: $funcao, contato: $contato)';

  @override
  bool operator ==(covariant OrgaoModel other) {
    if (identical(this, other)) return true;

    return other.orgao == orgao &&
        other.funcao == funcao &&
        other.contato == contato;
  }

  @override
  int get hashCode => orgao.hashCode ^ funcao.hashCode ^ contato.hashCode;
}
