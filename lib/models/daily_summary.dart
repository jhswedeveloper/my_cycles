class DailySummary {
  final String id;
  final String comment;
  final String owner;
  final List<String> moods;
  final List<Activity> activities;
  final DateTime updated;
  final DateTime created;

  DailySummary({this.id, this.comment, this.owner, this.moods, this.activities, this.updated, this.created});

  factory DailySummary.fromMap(Map data) {
    return DailySummary(
      id: data['id'] ?? '',
      comment: data['comment'] ?? '',
      owner: data['owner'] ?? '',
      moods: data['moods'] ?? [],
      activities: data['activities'] ?? [],
      updated: data['updated'] ?? DateTime.now(),
      created: data['created'] ?? DateTime.now(),
    );
  }
}

enum Activity { PERIOD, OVULATION, PMS }
