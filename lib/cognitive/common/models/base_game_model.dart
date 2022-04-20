import 'package:cardiocare_expressive_writting/cognitive/common/types/game_status_type.dart';

abstract class BaseGameModel {
  GameStatusType get status;

  DateTime? get startTime;

  DateTime? get endTime;

  double? get minResponseTime;

  double? get maxResponseTime;

  double? get avgResponseTime;
}
