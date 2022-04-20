import 'package:cardiocare_expressive_writting/cognitive/word/types/find_word_types.dart';

final Map<FindWordOrientation, FindWordCheckOrientationFn>
    findWordCheckOrientations = {
  FindWordOrientation.horizontal: (int x, int y, int h, int w, int l) {
    return w >= x + l;
  },
  FindWordOrientation.horizontalBack: (int x, int y, int h, int w, int l) {
    return x + 1 >= l;
  },
  FindWordOrientation.vertical: (int x, int y, int h, int w, int l) {
    return h >= y + l;
  },
  FindWordOrientation.verticalUp: (int x, int y, int h, int w, int l) {
    return y + 1 >= l;
  },
  FindWordOrientation.diagonal: (int x, int y, int h, int w, int l) {
    return w >= x + l && h >= y + l;
  },
  FindWordOrientation.diagonalBack: (int x, int y, int h, int w, int l) {
    return x + 1 >= l && h >= y + l;
  },
  FindWordOrientation.diagonalUp: (int x, int y, int h, int w, int l) {
    return w >= x + l && y + 1 >= l;
  },
  FindWordOrientation.diagonalUpBack: (int x, int y, int h, int w, int l) {
    return x + 1 >= l && y + 1 >= l;
  },
};
