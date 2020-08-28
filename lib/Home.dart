import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Controle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Stack(
      children: <Widget>[
        Image.asset(
          "images/coronavirus.jpg",
          fit: BoxFit.cover,
          height: 800,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 15)
            ),

            Text(
              "CONTROLE ESTABELECIMENTO ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 40,
                  shadows: [
                    Shadow(
                        blurRadius: 5.0,
                        color: Colors.blue,
                        offset: Offset(5.0, 5.0)
                    ),
                  ]

              ),
            ),

            RaisedButton(
              onPressed: (){
                Navigator.push(  // Navegar entre telas
                    context,   // Não precisamos criar, pois já existe dentro do método build
                    MaterialPageRoute(
                        builder: (context) => Controle()
                    )      // mudamos o route para outra classe, que já constroi a nossa rota
                );
              },
              color: Colors.blue,
              child: Text(
                "INICIAR",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white
                ),
              ),
            )


          ],
        )
      ],
    );
  }
}
