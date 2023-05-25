import 'package:flutter/material.dart';

import '../../../data/models/sos_model.dart';

class Sos extends StatefulWidget {
  const Sos({super.key});

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  List<SosModel> dados = [
    SosModel("DEFESA CIVIL",
        "Quando alagamento, inundaçoes, deslizamento, desmoronamento", "199"),
    SosModel(
        "DEFESA CIVIL", "Quando ocorrência de afogamento, soterramento", "199"),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SosModel dropdownValue = dados.first;
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "SOS",
            style: TextStyle(
                color: Color(0xff0D1937),
                fontSize: 36,
                fontWeight: FontWeight.bold),
          )),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              color: const Color.fromARGB(255, 222, 231, 235),
              height: size.height * 0.1,
              width: size.width,
              child: DropdownButton<SosModel>(
                padding: const EdgeInsets.all(5),
                isExpanded: true,
                value: dropdownValue,
                elevation: 0,
                onChanged: (SosModel? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: dados.map<DropdownMenuItem<SosModel>>((SosModel value) {
                  return DropdownMenuItem<SosModel>(
                    value: value,
                    child: Text(value.situacao),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
