import 'package:flutter/material.dart';


//kullanıcı-verisi

class UserVerisi{
  String? seciliCinsiyet;
  double icilenSigara;
  double yapilanSpor;
  int boy;
  int kilo;
  UserVerisi({required this.seciliCinsiyet,required this.icilenSigara,required this.yapilanSpor,required this.kilo,required this.boy});
}

class IconCinsiyet extends StatelessWidget {
  final String cinsiyet;
  final IconData icon;
  const IconCinsiyet({
    required this.icon,
    this.cinsiyet = "Cinsiyetsiz",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Icon(
          icon,
          size: 50,
          color: Colors.black54,
        ),
        const SizedBox(height: 10,),
        Text(
          cinsiyet,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
class MyContainer extends StatelessWidget {
  final Color renk;
  final Widget? child;

  const MyContainer({this.renk = Colors.white, required this.child  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: renk,
      ),
      child: child,
    );
  }
}
class MyContainerGender extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final double sag;
  final double sol;

  const MyContainerGender({this.renk = Colors.white, required this.child,this.sag =40,this.sol = 40  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight:Radius.circular(40),topLeft: Radius.circular(40),bottomRight: Radius.circular(sag),bottomLeft: Radius.circular(sol) ),
        color: renk,
      ),
      child: child,
    );
  }
}

//constants

TextStyle myStyle = const TextStyle(
  fontSize: 30,
  color: Color(0xFF00cc99),
  fontWeight: FontWeight.bold,
);
TextStyle myStyle1 = const TextStyle(
  fontSize: 20,
  color: Colors.black45,
  fontWeight: FontWeight.bold,
);