import 'package:flutter/material.dart';
import 'package:sanear/app/presentation/controllers/home_controller.dart';
import 'package:sanear/app/presentation/utils/color_palette.dart';
import 'package:sanear/app/presentation/widgets/city_info_widget.dart';
import 'components/custom_button.dart';
import '../sos/sos.dart';

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
                    CustomButton(
                        url: "https://www.embasa.ba.gov.br",
                        child: Image.asset(
                          "assets/img/embasa.png",
                          fit: BoxFit.fitWidth,
                        )),
                    CustomButton(
                        url: "https://limpurb.salvador.ba.gov.br",
                        child: Image.asset(
                          "assets/img/limpurb.png",
                          fit: BoxFit.fitWidth,
                        )),
                    CustomButton(
                        url: "http://www.codesal.salvador.ba.gov.br",
                        child: Image.asset(
                          "assets/img/codesal.png",
                          fit: BoxFit.fitWidth,
                        )),
                    const CustomButton(
                        url:
                            "http://www.saude.salvador.ba.gov.br/servicos/servicos-para-o-cidadao/zoonoses",
                        child: Center(
                          child: Text(
                            "Centro de Zoonozes de Salvador",
                            style: TextStyle(
                                color: ColorPalette.blueColor,
                                fontWeight: FontWeight.w900),
                          ),
                        )),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
