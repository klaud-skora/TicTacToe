import 'dart:math';
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

class TicTacToe {
  List<int> _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8]; //indexes of free fields
  List<Move> _moves = [Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank ];

  Sign _player = Sign.cross;
  Sign _computer = Sign.donut;
  Sign _winner;
  String result = '';

  Sign get player => _player;
  Sign get computer => _computer;
  Sign get winner => _winner;

  List<int> get freeFields => _freeFields;
  List<Move> get moves => _moves; 

  void setMove(sign, index) {
    print(sign);
    _moves[index] = sign == Sign.cross ? Move.X : Move.O;
    _freeFields.remove(index);
    getWinner(sign, index);
  }

  move(sign, index) {
    setMove(sign, index);
    freeFields.length > 0  && winner == null ? computerMove() 
        : result = 'End of game';
  }

  void computerMove() {
    var random = new Random();
    int computerTurn = random.nextInt(8);
    _freeFields.contains(computerTurn) ? setMove(computer, computerTurn) : computerMove();
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
      ((index == 0 || index == 1 || index == 2) && moves[index + 3] == sign && moves[index + 6] == sign )
      || 
      ((index == 3 || index == 4 || index == 5) && moves[index + 3] == sign && moves[index - 3] == sign )
      ||
      ((index == 6 || index == 7 || index == 8) && moves[index - 3] == sign && moves[index - 6] == sign )
      ||
      ((index == 0 || index == 3 || index == 6) && moves[index + 1] == sign && moves[index + 2] == sign) 
      ||
      ((index == 1 || index == 4 || index == 7) && moves[index + 1] == sign && moves[index - 1] == sign )
      ||
      ((index == 2 || index == 5 || index == 8) && moves[index - 1] == sign && moves[index - 2] == sign )
      ||
      ((index == 2 &&  moves[index + 2] == sign && moves[index + 4] == sign ) || (index == 4 &&  moves[index + 2] == sign && moves[index - 2] == sign ) || (index == 8 &&  moves[index - 2] == sign && moves[index - 4] == sign) )
      ||
      ((index == 0 &&  moves[index + 4] == sign && moves[index + 8] == sign ) || (index == 4 &&  moves[index - 4] == sign && moves[index + 4] == sign ) || (index == 8 &&  moves[index - 4] == sign && moves[index - 8] == sign) )
      ) {
        _winner = Sign.cross.value == sign ? Sign.cross : Sign.donut;
    } 
  }

  clearGame() {
    _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8];
   _moves = [Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank, Move.Blank ];
    result = '';
  }

}

