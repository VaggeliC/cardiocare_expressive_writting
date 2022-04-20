import 'package:cardiocare_expressive_writting/cognitive/word/types/find_word_types.dart';
import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_position.dart';

/// Word location interface
class FindWordLocation implements FindWordPosition {
  /// The column position where the word starts
  @override
  final int x;

  /// The row position where the word starts
  @override
  final int y;

  int get endX {
    final int steps = word.length - 1;

    switch (orientation) {
      case FindWordOrientation.diagonal:
        return x + steps;
      case FindWordOrientation.diagonalBack:
        return x - steps;
      case FindWordOrientation.diagonalUp:
        return x + steps;
      case FindWordOrientation.diagonalUpBack:
        return steps - x;
      case FindWordOrientation.horizontal:
        return x + steps;
      case FindWordOrientation.horizontalBack:
        return x - steps;
      case FindWordOrientation.vertical:
        return x;
      case FindWordOrientation.verticalUp:
        return x;
    }
  }

  int get endY {
    final int steps = word.length - 1;

    switch (orientation) {
      case FindWordOrientation.diagonal:
        return y + steps;
      case FindWordOrientation.diagonalBack:
        return y + steps;
      case FindWordOrientation.diagonalUp:
        return y - steps;
      case FindWordOrientation.diagonalUpBack:
        return y - steps;
      case FindWordOrientation.horizontal:
        return y;
      case FindWordOrientation.horizontalBack:
        return y;
      case FindWordOrientation.vertical:
        return y + steps;
      case FindWordOrientation.verticalUp:
        return y - steps;
    }
  }

  /// The orientation the word placed in the puzzle
  final FindWordOrientation orientation;

  /// The numbed of overlaps the word has
  final int overlap;

  /// The word used
  String word;

  FindWordLocation({
    required this.x,
    required this.y,
    required this.orientation,
    required this.overlap,
    required this.word,
  });
}
