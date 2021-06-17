import 'package:flutter/material.dart';
import 'package:splash_anim/splash.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Carregou!', style: TextStyle(fontSize: 36.0)),
          ),
          SizedBox(height: 50.0),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
            child: Text('De novo!'),
          )
        ],
      ),
    );
  }
}
