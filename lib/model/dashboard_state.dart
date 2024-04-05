class DashBoardState {
  DateTime dateTime;

  DashBoardState({required this.dateTime});

  factory DashBoardState.fromJson(Map<String, dynamic> json) {
    return DashBoardState(
      dateTime: DateTime.parse(json['dateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateTime': dateTime.toIso8601String(),
    };
  }

  DashBoardState copyWith({
    DateTime? dateTime,
  }) {
    return DashBoardState(
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
