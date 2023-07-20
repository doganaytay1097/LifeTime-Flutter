import 'package:finalodev/sonuc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.medievalSharp().fontFamily,
        primaryColor: const Color(0xFF00cc99),
        scaffoldBackgroundColor: const Color(0XFF00a37a),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 10;
  double yapilanSpor = 4;
  int boy = 170;
  int kilo = 75;

  void secim(String cinsiyet) {
    setState(() {
      seciliCinsiyet = cinsiyet;
    });
  }

  Row buildOutline(String label) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: myStyle1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label == "BOY" ? boy.toString() : kilo.toString(),
                style: myStyle,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (label == "BOY") {
                      boy++;
                    } else {
                      kilo++;
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF00cc99)),
                ),
                child: const Icon(
                  Icons.add,
                  color: Color(0xFF00664c),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (label == "BOY") {
                      boy--;
                    } else {
                      kilo--;
                    }
                  });
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFF00cc99)),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Color(0xFF00664c),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        splashColor: const Color(0xFF66e0c1),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:Radius.circular(50),topLeft: Radius.circular(50),bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60) ), ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Sonuc(
                    userVerisi: UserVerisi(
                        kilo: kilo,
                        seciliCinsiyet: seciliCinsiyet,
                        yapilanSpor: yapilanSpor,
                        icilenSigara: icilenSigara,
                        boy: boy)),
              ));
        },
        backgroundColor: Colors.white,
        child: const Align(
            alignment: Alignment.center,
            child: Text(
              "HESAPLA",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.black54,
              ),
            )),
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00664c),
        title: const Text(
          'YAŞAM ÖLÇER',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Haftada Kaç Saat Spor Yapıyorsun?",
                    style: myStyle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${yapilanSpor.round()}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Slider(
                    min: 0,
                    max: 10,
                    divisions: 10,
                    activeColor: const Color(0xFF00cc99),
                    value: yapilanSpor,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSpor = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: MyContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildOutline("KİLO"),
                      ),
                    )),
                Expanded(
                    child: MyContainer(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildOutline("BOY"),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ayda Kaç Paket Sigara İçiyorsun?",
                    style: myStyle1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${icilenSigara.round()}",
                    style: myStyle,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: icilenSigara,
                    activeColor: const Color(0xFF00cc99),
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        secim("KADIN");
                      });
                    },
                    child: MyContainerGender(
                      sag: 90,
                      renk: seciliCinsiyet == "KADIN"
                          ? const Color(0xFF66e0c1)
                          : Colors.white,
                      child: const IconCinsiyet(
                        icon: FontAwesomeIcons.venus,
                        cinsiyet: 'KADIN',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        secim("ERKEK");
                      });
                    },
                    child: MyContainerGender(
                      sol: 90,
                      renk: seciliCinsiyet == "ERKEK"
                          ? const Color(0xFF66e0c1)
                          : Colors.white,
                      child: const IconCinsiyet(
                        icon: FontAwesomeIcons.mars,
                        cinsiyet: "ERKEK",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
