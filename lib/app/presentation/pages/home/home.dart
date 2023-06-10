import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/controllers/home_controller.dart';
import 'package:sanear/app/presentation/widgets/city_info_widget.dart';

import '../../utils/color_palette.dart';
import '../sos/sos.dart';
import 'components/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.homeController});
  final HomeController homeController;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    widget.homeController.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFFB01E1E))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Sos()));
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
          body: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: widget.homeController.loadingNotifier,
                builder: (_, dynamic loading, __) {
                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (widget.homeController.weather == null) {
                    return const Center(
                        child: Text('Erro ao consultar previsão do Tempo'));
                  }

                  return CityInfoWidget(
                    weather: widget.homeController.weather!,
                  );
                },
              ),

              // Grid view
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/img/embasa.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/img/limpurb.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(
                        "assets/img/codesal.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
