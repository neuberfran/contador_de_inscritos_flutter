
import 'package:contador_de_inscritos_flutter/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image(
          width: 250,
          image: AssetImage('assets/images/logo_ytb_lapadev.png'),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => MainPage()
      ));
    });

  }


}
