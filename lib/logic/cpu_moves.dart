import './tic_tac_toe.dart';
import 'dart:math';

abstract class CpuMoves {
  int index;
  int move(List<Move> moves) { return index; }
}

class RandomCpuMove extends CpuMoves {

  @override
  int move(List<Move> moves) { 
    var random = new Random();
    int cpuMove = random.nextInt(moves.length - 1);
    return cpuMove;
  }
}

class TestCpuMoves extends CpuMoves {

	final List<int> moves;
	int currentIndex = 0;

	TestCpuMoves(this.moves);

	int move(List<Move> board) {
		return moves[currentIndex++];
	}
}