import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_position.dart';

/// Default letters to fill in the empty spaces
const String findWordDefaultLetters = 'abcdefghijklmnoprstuvwyz';

/// All the orientations available to build the puzzle
enum FindWordOrientation {
  /// Horizontal orientation
  horizontal,

  /// horizontal reverse orientation
  horizontalBack,

  /// Vertical orientation
  vertical,

  /// Vertical reverse orientation
  verticalUp,

  /// Diagonal down orientation
  diagonal,

  /// Diagonal up orientation
  diagonalUp,

  /// Diagonal down reverse orientation
  diagonalBack,

  /// Diagonal up reverse orientation
  diagonalUpBack
}

/// Orientation function interface
typedef FindWordOrientationFn = FindWordPosition Function(int x, int y, int i);

/// Check orientation function interface
typedef FindWordCheckOrientationFn = bool Function(
    int x, int y, int h, int w, int l);
