import 'package:flutter_test/flutter_test.dart';
import '../lib/logic/tic_tac_toe.dart';
import '../lib/logic/cpu_moves.dart';
import '../lib/ui/sign_extension.dart';

void main() {
  
  test('Make 1 move', () {
    CpuMoves testMoves = TestCpuMoves([0, 2, 4]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move(ttt.player.value, 0);
    expect((ttt.state is GameInProgress),  true);
  });

  test('result for player\'s win - playing with x', () {
    CpuMoves testMoves = TestCpuMoves([0, 2, 4]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move(ttt.player.value, 6);
    ttt.move(ttt.player.value, 7);
    ttt.move(ttt.player.value, 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.X);
  });

  test('result for computer\'s win - playing with o', () {
    CpuMoves testMoves = TestCpuMoves([1, 4, 7]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move(ttt.player.value, 0);
    ttt.move(ttt.player.value, 2);
    ttt.move(ttt.player.value, 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.O);
  });

  test('result for player\'s win - playing with o', () {
    CpuMoves testMoves = TestCpuMoves([0, 1, 3]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move(ttt.player.value, 2);
    ttt.move(ttt.player.value, 5);
    ttt.move(ttt.player.value, 8);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.O);
  });

  test('result for computer\'s win - playing with x', () {
    CpuMoves testMoves = TestCpuMoves([2, 0, 1]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move(ttt.player.value, 8);
    ttt.move(ttt.player.value, 4);
    ttt.move(ttt.player.value, 3);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.X);
  });

  test('result for computer\'s win - playing with x 2', () {
  CpuMoves testMoves = TestCpuMoves([2,4,6]);
  TicTacToe ttt = TicTacToe(testMoves);
  ttt.setSigns();
  ttt.move(ttt.player.value, 0);
  ttt.move(ttt.player.value, 1);
  ttt.move(ttt.player.value, 3);
  expect((ttt.state is GameEnded),  true);
  expect(ttt.gameResult, FinishedGameResult.X);
});

  test('result for draw for player = x && computer = o', () {
    CpuMoves testMoves = TestCpuMoves([1, 4, 6, 5]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.move(ttt.player.value, 0);
    ttt.move(ttt.player.value, 3);
    ttt.move(ttt.player.value, 7);
    ttt.move(ttt.player.value, 8);
    ttt.move(ttt.player.value, 2);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.Draw);
  });

  test('result for draw for player = o && computer = x', () {
    CpuMoves testMoves = TestCpuMoves([2, 4, 0, 7]);
    TicTacToe ttt = TicTacToe(testMoves);
    ttt.setSigns();
    ttt.move(ttt.player.value, 3);
    ttt.move(ttt.player.value, 1);
    ttt.move(ttt.player.value, 6);
    ttt.move(ttt.player.value, 8);
    ttt.move(ttt.player.value, 5);
    expect((ttt.state is GameEnded),  true);
    expect(ttt.gameResult, FinishedGameResult.Draw);
  });

}
