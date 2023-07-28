import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../data/models/sos_model.dart';
import '../../controllers/sos_controller.dart';
import 'components/card_contato.dart';

class Sos extends StatefulWidget {
  const Sos({super.key});

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  var dropdownValue = ValueNotifier<SosModel?>(null);
  SosController sosController = SosController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              "SOS",
              style: TextStyle(
                  color: Color(0xff0D1937),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            )),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: sosController.buscarSosModel(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.data != null) {
                      return ValueListenableBuilder(
                          valueListenable: dropdownValue,
                          builder: (_, SosModel? valor, __) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: DropdownButton<SosModel>(
                                enableFeedback: false,
                                hint: const Text(
                                    "Clique aqui e selecione a emergência!"),
                                isExpanded: true,
                                dropdownColor:
                                    const Color.fromARGB(255, 247, 242, 242),
                                underline: const SizedBox(),
                                value: valor,
                                elevation: 0,
                                onChanged: (escolha) =>
                                    dropdownValue.value = escolha,
                                items: snapshot.data!
                                    .map<DropdownMenuItem<SosModel>>(
                                        (SosModel value) {
                                  return DropdownMenuItem<SosModel>(
                                    value: value,
                                    child: Text(
                                      value.situacao,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                }).toList(),
                              ),
                            );
                          });
                    }

                    if (snapshot.hasError) {
                      return Container();
                    }

                    return Container();
                  }),
              const SizedBox(
                height: 10,
              ),
              ValueListenableBuilder(
                  valueListenable: dropdownValue,
                  builder: (_, SosModel? dado, __) {
                    if (dado != null) {
                      return CardContato(
                        selecionar: () async {
                          final Uri launchUri = Uri(
                            scheme: 'tel',
                            path: dado.contato,
                          );
                          await launchUrl(launchUri);
                        },
                        contato: dado.contato,
                        orgao: dado.orgao,
                      );
                    }
                    return Container();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
