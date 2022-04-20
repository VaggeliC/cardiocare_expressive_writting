import 'package:cardiocare_expressive_writting/cognitive/word/types/find_word_types.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_position.dart';

final Map<FindWordOrientation, FindWordOrientationFn> findWordSkipOrientations =
    {
  FindWordOrientation.horizontal: (int x, int y, int l) {
    return FindWordPosition(x: 0, y: y + 1);
  },
  FindWordOrientation.horizontalBack: (int x, int y, int l) {
    return FindWordPosition(x: l - 1, y: y);
  },
  FindWordOrientation.vertical: (int x, int y, int l) {
    return FindWordPosition(x: 0, y: y + 100);
  },
  FindWordOrientation.verticalUp: (int x, int y, int l) {
    return FindWordPosition(x: 0, y: l - 1);
  },
  FindWordOrientation.diagonal: (int x, int y, int l) {
    return FindWordPosition(x: 0, y: y + 1);
  },
  FindWordOrientation.diagonalBack: (int x, int y, int l) {
    return FindWordPosition(x: l - 1, y: x >= l - 1 ? y + 1 : y);
  },
  FindWordOrientation.diagonalUp: (int x, int y, int l) {
    return FindWordPosition(x: 0, y: y < l - 1 ? l - 1 : y + 1);
  },
  FindWordOrientation.diagonalUpBack: (int x, int y, int l) {
    return FindWordPosition(x: l - 1, y: x >= l - 1 ? y + 1 : y);
  }
};
