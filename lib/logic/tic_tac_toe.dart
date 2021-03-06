import '../ui/sign_extension.dart';

enum Sign {
  cross,
  donut,
}

enum Move {
  X,
  O,
  Blank,
}

extension MoveExtension on Move {
  static final contents = {
    Move.X: Sign.cross.value,
    Move.O: Sign.donut.value,
    Move.Blank: '',
  };

  String get content => contents[this];
}

enum FinishedGameResult {
  X,
  O,
  Draw,
}

extension FinishedGameResultExtension on FinishedGameResult {
  static final infos = {
    FinishedGameResult.X: '\'x\' won the game',
    FinishedGameResult.O: '\'o\' won the game',
    FinishedGameResult.Draw: 'It\' a draw !',
  };

  String get info => infos[this];
}

abstract class Result {}

class GameInProgress extends Result {}

class GameEnded extends Result {
  final FinishedGameResult result;
  GameEnded(this.result);	
}

class TicTacToe {
  final cpu;
  TicTacToe(this.cpu);
  List<Move> _moves = [Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank ];

  Sign _player = Sign.cross;
  Sign _computer = Sign.donut;
  Sign _winner;
  FinishedGameResult _gameResult;

  Sign get player => _player;
  Sign get computer => _computer;
  Sign get winner => _winner;
  FinishedGameResult get gameResult => _gameResult;

  List<Move> get moves => _moves; 

  Result get state {
    var returnStatement;
    if (!moves.contains(Move.Blank) && !isWinner()){
      _gameResult = FinishedGameResult.Draw;
      return GameEnded(FinishedGameResult.Draw);
    } else if(isWinner()) {
        if(winner.value == Sign.cross.value) {
          _gameResult = FinishedGameResult.X;
          returnStatement = GameEnded(FinishedGameResult.X);
        }
        if(winner.value == Sign.donut.value) {
          _gameResult = FinishedGameResult.O;
          returnStatement = GameEnded(FinishedGameResult.O);
        }
      return returnStatement;
    } else {
      return GameInProgress();
    }
  }

  bool isWinner() {
    return winner.value != null;
  }

  void setMove(sign, index) {
    _moves[index] = sign == Sign.cross.value ? Move.X : Move.O;
    getWinner(sign, index);
  }

  move(sign, index) {
    setMove(sign, index);
    if(moves.contains(Move.Blank)  && winner == null) getCpuMove();
  }

  void getCpuMove() {
    int cpuMove = cpu.move(moves);
    moves[cpuMove] == Move.Blank ? setMove(computer.value, cpuMove) : getCpuMove();
  }

  setSigns() {
    switch(_player) {
      case Sign.cross: 
        _player = Sign.donut;
        _computer = Sign.cross;
        break;
      case Sign.donut:
        _player = Sign.cross;
        _computer = Sign.donut;
        break;
    }
  }

  getWinner(sign, index) {
    if(
      ((index == 0 || index == 1 || index == 2) && moves[index + 3].content == sign && moves[index + 6].content == sign )
      || 
      ((index == 3 || index == 4 || index == 5) && moves[index + 3].content == sign && moves[index - 3].content == sign )
      ||
      ((index == 6 || index == 7 || index == 8) && moves[index - 3].content == sign && moves[index - 6].content == sign )
      ||
      ((index == 0 || index == 3 || index == 6) && moves[index + 1].content == sign && moves[index + 2].content == sign) 
      ||
      ((index == 1 || index == 4 || index == 7) && moves[index + 1].content == sign && moves[index - 1].content == sign )
      ||
      ((index == 2 || index == 5 || index == 8) && moves[index - 1].content == sign && moves[index - 2].content == sign )
      ||
      ((index == 2 &&  moves[index + 2].content == sign && moves[index + 4].content == sign ) || (index == 4 &&  moves[index + 2].content == sign && moves[index - 2].content == sign ) || (index == 6 &&  moves[index - 2].content == sign && moves[index - 4].content == sign) )
      ||
      ((index == 0 &&  moves[index + 4].content == sign && moves[index + 8].content == sign ) || (index == 4 &&  moves[index - 4].content == sign && moves[index + 4].content == sign ) || (index == 8 &&  moves[index - 4].content == sign && moves[index - 8].content == sign) )
      ) {
        _winner = Sign.cross.value == sign ? Sign.cross : Sign.donut;
    } 
  }

  clearGame() {
    _winner = null;
    _moves = [Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank ];
    // _moves.forEach((move) {move = Move.Blank; });
  }

}

