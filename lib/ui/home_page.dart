import 'package:flutter/material.dart';

import './sign_extension.dart';
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

  @override
  Widget build(BuildContext context) {
    void _makeMove(index) {
      setState(() { game.move(game.player.value, index); });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: (game.state is GameInProgress) ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                  onTap: game.freeFields.contains(index) && game.isWinner() == false ? () {
                    _makeMove(index);
                  } : null,
                  child: Container(
                    alignment: Alignment(0.0,0.0),
                    child: Text(
                      game.moves[index].content,
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
            FlatButton(
              onPressed: () {
                setState(() { game.clearGame(); });
              }, 
              child: Text('New game'),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ) : Column(
          children: <Widget>[
            SizedBox(height: 200.0),
            Text(game.gameResult.info),
            SizedBox(height: 10.0),
            Text(game.winner.value == null ? '' : game.winner.value == game.player.value ? 'Congrats !' : 'Sorry, you lose' ),
            SizedBox(height: 20.0),
            FlatButton(
              onPressed: () {
                setState(() { game.clearGame(); });
              }, 
              child: Text('New game'),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
