import 'package:flutter/material.dart';

class CardContato extends StatelessWidget {
  const CardContato({
    super.key,
    required this.orgao,
    required this.contato,
    required this.selecionar,
  });

  final String? orgao;
  final String? contato;
  final Function() selecionar;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: selecionar,
      child: Container(
        width: size.width,
        height: size.height * 0.2,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 199, 16, 3), width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(4, 4),
                color: Color.fromARGB(255, 255, 30, 14),
              )
            ],
            color: const Color.fromARGB(255, 255, 70, 70)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              orgao ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
            const Text(
              "Toque aqui para realizar a ligação!",
              style: TextStyle(
                  color: Color.fromARGB(255, 58, 2, 2),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              contato ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 34,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
