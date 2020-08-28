import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Controle extends StatefulWidget {
  @override
  _ControleState createState() => _ControleState();
}

class _ControleState extends State<Controle> {


  //Ao clicar nos botões, eu quero que na frente de pessoa mude de 0 para o tanto de pessoas que está entrando ou saindo
  //Vou criar então uma varial e pessoa, e chamar ela dentro do txt correspondente

  int _people = 0;

  int _numPeople = 0;

  //Vamos alterar o texto de pode entrar, vamos agora definir uma quantidade de pessoas permitidas

  String _infoText = "Pode Entrar!";

  // Configurar botão adicionar

  void calculate(){

      _numPeople = int.parse(pessoaController.text);

  }

  void _changePeople(int delta){  //O int delta vai receber o valor dos botões.

  setState(() {
  _people += delta;

  //Definindo quantidade de pessoas

  if(_people < 0){
  _infoText = "Algo de errado não está certo";
  }else if(_people <= _numPeople){
  _infoText = "Pode Entrar!";
  }else{
  _infoText = "Quantidade permitida excedida. Estamos Lotados!";
  }
  });

  }
  //----------------------------------------------------------------------

  //Definir um controller para receber o texto

  TextEditingController pessoaController = TextEditingController();

  String _infoPessoa = "Pessoas: ";

  //Definir botão de Reset

  void _resetField(){
    pessoaController.text = " ";
    setState(() {
      _people = 0;
      _infoText = "Pode Entrar!";

    });
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle Estabelecimento"),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetField
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Icon(
              Icons.person,
              size: 120,
              color: Colors.blue,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Defina a quantidade pessoas permitidas"
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20
              ),
              controller: pessoaController,
            ),

            Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10)
            ),
            Container(
              height: 50,
              child: RaisedButton.icon(
                onPressed: calculate,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                label: Text(
                  "Adicionar",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),
                ),
                color: Colors.blue,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16)
            ),
            Text(
              "Pessoas: $_people",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  fontSize: 40
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                    onPressed: (){
                      //debugPrint("+1"); //Testar se o botão está funcionando
                      //_people++;
                      _changePeople(1);
                    },
                    child: Text(
                      "+1",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black
                      ),
                    )
                ),
                FlatButton(
                    onPressed: (){
                      //debugPrint("+1");
                      // _people--;
                      _changePeople(-1);
                    },
                    child: Text(
                      "-1",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.black
                      ),
                    )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16),
            ),
            Text(
              //"Pode Entrar!",
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                  decoration: TextDecoration.none
              ),
            )

          ],
        ),
      ),
    );
  }
}
