import '../logic/tic_tac_toe.dart';

extension SignExtension on Sign {
  static final values = {
    Sign.cross: 'x',
    Sign.donut: 'o',
  };

  String get value => values[this];
}