import 'package:mycycles/models/daily_summary.dart';
import 'package:mycycles/models/user.dart';

class Global {
  static final Map models = {
    User: (data) => User.fromMap(data),
    DailySummary: (data) => DailySummary.fromMap(data),
  };
}
