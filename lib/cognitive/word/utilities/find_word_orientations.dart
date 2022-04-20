import 'package:cardiocare_expressive_writting/cognitive/word/types/find_word_types.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_position.dart';

final Map<FindWordOrientation, FindWordOrientationFn> findWordOrientations = {
  FindWordOrientation.horizontal: (int x, int y, int i) {
    return FindWordPosition(x: x + i, y: y);
  },
  FindWordOrientation.horizontalBack: (int x, int y, int i) {
    return FindWordPosition(x: x - i, y: y);
  },
  FindWordOrientation.vertical: (int x, int y, int i) {
    return FindWordPosition(x: x, y: y + i);
  },
  FindWordOrientation.verticalUp: (int x, int y, int i) {
    return FindWordPosition(x: x, y: y - i);
  },
  FindWordOrientation.diagonal: (int x, int y, int i) {
    return FindWordPosition(x: x + i, y: y + i);
  },
  FindWordOrientation.diagonalBack: (int x, int y, int i) {
    return FindWordPosition(x: x - i, y: y + i);
  },
  FindWordOrientation.diagonalUp: (int x, int y, int i) {
    return FindWordPosition(x: x + i, y: y - i);
  },
  FindWordOrientation.diagonalUpBack: (int x, int y, int i) {
    return FindWordPosition(x: x - i, y: y - i);
  }
};
