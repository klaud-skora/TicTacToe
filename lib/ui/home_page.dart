import 'package:flutter/material.dart';
import 'package:tictactoe/logic/tic_tac_toe.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool switchOn = true;
  TicTacToe game = TicTacToe();  
  String result = '';
  

  @override
  Widget build(BuildContext context) {
    void _makeMove(index) {
      setState(() {
        game.setMove(game.playerSign, index);
        game.freeFields.length > 0  && game.winner != game.playerSign ? game.computerMove() : result = 'End of game!';
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(game.winner),
            Text(result),
            Text('You play as ${switchOn ? 'cross' : 'donut'}' ),
            Switch(
              value: switchOn,
              onChanged: (bool state) {
                setState(() {
                  game.clearGame();
                  switchOn = state;
                  game.setSigns();
                });
              },
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              scrollDirection: Axis.vertical,
              itemCount: 9,
              itemBuilder: (contex, index) => GestureDetector(
                onTap: game.freeFields.contains(index) ? () {
                  _makeMove(index);
                } : null,
                child: Container(
                  alignment: Alignment(0.0,0.0),
                  child: Text(
                    game.moves[index],
                    style: TextStyle(
                      fontSize: 44,
                      color: Colors.grey.shade100,
                    ),
                  ),
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
