import 'package:cardiocare_expressive_writting/cognitive/word/utilities/find_word_location.dart';

/// The solved puzzle interface
class FindWordSolved {
  /// List of words found by solving the puzzle
  List<FindWordLocation> found;

  /// List of words that were not found while solving the puzzle
  List<String> notFound;

  FindWordSolved({
    List<FindWordLocation>? found,
    List<String>? notFound,
  })  : found = found ?? [],
        notFound = notFound ?? [];
}
