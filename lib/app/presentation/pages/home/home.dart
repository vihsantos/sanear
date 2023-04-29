import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
              color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: ElevatedButton(
              onPressed: null,
              child: Icon(Icons.sos),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2D7),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            width: size.width,
            height: size.height * 0.26,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.wb_sunny_outlined,
                          size: 80, color: Color(0xFFE97E31)),
                      Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.pin_drop_outlined),
                              Text("Sua localização")
                            ],
                          ),
                          const Text("Previsão de Sol"),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text("Temperatura"),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("32º MAX"),
                        Text("32º MIN"),
                      ]),
                ]),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  "assets/img/embasa.svg",
                  height: size.height * 0.005,
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
