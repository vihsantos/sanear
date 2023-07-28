import 'package:flutter/material.dart';
import 'package:sanear/app/data/constants.dart';
import 'package:sanear/app/domain/entities/weather.dart';
import 'package:sanear/app/presentation/widgets/app_text_componet.dart';

class CityInfoWidget extends StatelessWidget {
  final Weather weather;

  const CityInfoWidget({
    Key? key,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, right: 15, left: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.pin_drop_outlined),
                      const SizedBox(width: 15),
                      Text(
                        weather.location.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const Text('Atualmente'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextComponent(
                        size: 30,
                        text: '${weather.current.tempC}º C',
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              weather.current.condition.text,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RichText(
                              text: TextSpan(
                                text: 'Sensação de ',
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '${weather.current.feelslikeC} c',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Image(
                image: NetworkImage(
                  Urls.weatherIcon(weather.current.condition.icon),
                  scale: 0.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
