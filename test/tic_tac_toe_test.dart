import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/logic/tic_tac_toe.dart';

  

void main() {

  TicTacToe ttt = TicTacToe();


  test('Make 1 move', () {
    ttt.move('x', 0);
    expect((ttt.state is GameInProgress),  true);
  });

}
