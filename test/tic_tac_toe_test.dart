import 'package:flutter_test/flutter_test.dart';
import 'package:tictactoe/logic/tic_tac_toe.dart';
import '../lib/logic/cpu_moves.dart';
  

void main() {
  CpuMoves testMoves = TestCpuMoves([0, 2, 4]);

  TicTacToe ttt = TicTacToe(testMoves);

  test('Make 1 move', () {
    ttt.move('x', 0);
    expect((ttt.state is GameInProgress),  true);
  });

}
