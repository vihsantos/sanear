import 'package:flutter/material.dart';

import '../../utils/color_palette.dart';
import '../sos/sos.dart';
import 'components/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sanear",
          style: TextStyle(
              color: Color(0xff0D1937),
              fontSize: 36,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFFB01E1E))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sos()));
              },
              child: const Icon(
                Icons.sos,
                color: Colors.white,
                size: 38,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFFDF2D7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: ColorPalette.diasdesol_02,
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        //spreadRadius: 1.0,
                        color: ColorPalette.diasdesol_02,
                        offset: Offset(4, 4))
                  ]),
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              width: size.width,
              height: size.height * 0.26,
              child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.wb_sunny_outlined,
                            size: 80, color: ColorPalette.diasdesol_02),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.pin_drop_outlined),
                                SizedBox(width: 15),
                                Text("Sua localização")
                              ],
                            ),
                            Text(
                              "Previsão de Sol",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 35),
                    Text("Temperatura"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("32º MAX"),
                          Text("32º MIN"),
                        ]),
                  ]),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 15, right: 15, top: 10, bottom: 10),
              width: size.width,
              height: size.height * 0.083,
              decoration: BoxDecoration(
                color: ColorPalette.backgroundsearch,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  CustomButton(
                      url: "https://www.embasa.ba.gov.br/",
                      child: Image.asset(
                        "assets/img/embasa.png",
                        fit: BoxFit.fitWidth,
                      )),
                  CustomButton(
                      url: "https://limpurb.salvador.ba.gov.br/",
                      child: Image.asset(
                        "assets/img/limpurb.png",
                        fit: BoxFit.fitWidth,
                      )),
                  CustomButton(
                      url: "http://www.codesal.salvador.ba.gov.br/",
                      child: Image.asset(
                        "assets/img/codesal.png",
                        fit: BoxFit.fitWidth,
                      )),
                  const CustomButton(
                      url:
                          "http://www.saude.salvador.ba.gov.br/servicos/servicos-para-o-cidadao/zoonoses/",
                      child: Center(
                          child: Text(
                        "Centro de Controle Zoonoses",
                        style: TextStyle(
                            color: Color(0xFF023E87),
                            fontWeight: FontWeight.bold),
                      )))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
