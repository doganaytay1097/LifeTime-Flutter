
import 'package:finalodev/widgets_constants.dart';
import 'package:flutter/material.dart';

class Sonuc extends StatelessWidget {
  final UserVerisi userVerisi;

  Sonuc({required this.userVerisi});

  double hesaplama() {
    double sonuc;

    sonuc = 65 + userVerisi.yapilanSpor - userVerisi.icilenSigara;
    sonuc = sonuc + (userVerisi.boy / userVerisi.kilo);

    if (userVerisi.seciliCinsiyet == "KADIN") {
      return sonuc + 5;
    } else {
      return sonuc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF00664c),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "SONUÇ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "BEKLENEN YAŞAM SÜREN",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
            child: Text(
              "${hesaplama().round()} YIL",
              style: const TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
