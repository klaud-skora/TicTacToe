import 'package:flutter_test/flutter_test.dart';
import '../lib/logic/tic_tac_toe.dart';
import '../lib/logic/cpu_moves.dart';

void main() {
  
  test('Make 1 move', () {
    CpuMoves testMoves = TestCpuMoves([0, 2, 4]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move('x', 0);
    expect((ttt.state is GameInProgress),  true);
  });

  test('result for player\'s win - playing with x', () {
    CpuMoves testMoves = TestCpuMoves([0, 2, 4]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move('x', 6);
    ttt.move('x', 7);
    ttt.move('x', 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.X);
  });

  test('result for computer\'s win - playing with o', () {
    CpuMoves testMoves = TestCpuMoves([1, 4, 7]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move('x', 0);
    ttt.move('x', 2);
    ttt.move('x', 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.O);
  });

  test('result for player\'s win - playing with o', () {
    CpuMoves testMoves = TestCpuMoves([0, 1, 3]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move('o', 2);
    ttt.move('o', 5);
    ttt.move('o', 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.O);
  });

  test('result for computer\'s win - playing with x', () {
    CpuMoves testMoves = TestCpuMoves([2, 0, 1]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move('x', 8);
    ttt.move('x', 4);
    ttt.move('x', 3);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.X);
  });

  test('result for draw for player = x && computer = o', () {
    CpuMoves testMoves = TestCpuMoves([1, 4, 6, 5]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move('x', 0);
    ttt.move('x', 3);
    ttt.move('x', 7);
    ttt.move('x', 8);
    ttt.move('x', 2);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.Draw);
  });

  test('result for draw for player = o && computer = x', () {
    CpuMoves testMoves = TestCpuMoves([4, 3, 2, 6]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move('o', 0);
    ttt.move('o', 5);
    ttt.move('o', 8);
    ttt.move('o', 7);
    ttt.move('o', 1);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.Draw);
  });

}
