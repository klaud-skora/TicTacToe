import 'dart:math';

class TicTacToe {
  List<int> _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8]; //indexes of free fields
  List<String> _moves = ['', '', '', '', '', '', '', '', '']; // content for fields
  List<int> _playerMoves = [];
  List<int> _computerMoves = [];

  String _playerSign = 'x';
  String _computerSign = 'o';
  String winner = '';
  String draw = 'It\'s a draw';

  String get playerSign => _playerSign;
  String get computerSign => _computerSign;
  List<int> get freeFields => _freeFields;
  List<String> get moves => _moves; 

  void setMove(sign, index) {
    _moves[index] = sign;
    _freeFields.remove(index);
    sign == playerSign ? _playerMoves.add(index) : _computerMoves.add(index);
    getWinner(sign, index);
  }

  void computerMove() {
    var random = new Random();
    int computerTurn = random.nextInt(8);
    _freeFields.contains(computerTurn) ? setMove(computerSign, computerTurn) : computerMove();
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
        winner = '\'' +  sign + '\'' + ' wins';
    } else if(_freeFields.length == 0 ) {
      winner = 'It\s a draw !';
    }
  }

  clearGame() {
    _freeFields = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    _moves = ['', '', '', '', '', '', '', '', ''];
    winner = '';
  }

}

