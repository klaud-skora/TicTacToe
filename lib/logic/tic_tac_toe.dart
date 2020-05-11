import 'dart:math';

class TicTacToe {
  List<int> _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8]; //indexes of free fields
  List<String> _moves = ['', '', '', '', '', '', '', '', '' ]; // content for fields

  String _playerSign = 'x';
  String _computerSign = 'o';

  String get playerSign => _playerSign;
  String get computerSign => _computerSign;
  List<int> get freeFields => _freeFields;
  List<String> get moves => _moves; 

  void setMove(sign, index) {
    _moves[index] = sign;
    _freeFields.remove(index);
  }

  void computerMove() {
    var random = new Random();
    int computerTurn = random.nextInt(8);
    _freeFields.contains(computerTurn) ? setMove(computerSign, computerTurn) :  computerMove();
  }

  setSigns() {
    switch(_playerSign) {
      case 'x': 
        _playerSign = 'o';
        _computerSign = 'x';
        break;
      case 'o':
        _playerSign = 'x';
        _computerSign = 'o';
        break;
    }
  }

  clearGame() {
    _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    _moves = ['', '', '', '', '', '', '', '', '' ];
  }
}