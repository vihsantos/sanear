import 'package:flutter/material.dart';

import '../../../data/models/sos_model.dart';

class Sos extends StatefulWidget {
  const Sos({super.key});

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  List<SosModel> dados = [
    SosModel(
        "DEFESA CIVIL",
        "Quando alagamento, inundaçoes, deslizamento, desmoronamento",
        "0800 0555 195"),
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Selecione a emergência:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 10,
              ),
              DropdownButton<SosModel>(
                isExpanded: true,
                //dropdownColor: const Color.fromARGB(255, 222, 231, 235),
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
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width,
                height: size.height * 0.15,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(57, 255, 37, 37)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      dropdownValue.orgao,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(
                      dropdownValue.contato,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 34),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
