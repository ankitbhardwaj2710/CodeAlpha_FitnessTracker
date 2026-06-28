class WaterModel {
  final int? id;
  final int amount;
  final DateTime dateTime;

  WaterModel({
    this.id,
    required this.amount,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'dateTime': dateTime.toIso8601String(),
    };
  }

  factory WaterModel.fromMap(Map<String, dynamic> map) {
    return WaterModel(
      id: map['id'],
      amount: map['amount'],
      dateTime: DateTime.parse(map['dateTime']),
    );
  }

  WaterModel copyWith({
    int? id,
    int? amount,
    DateTime? dateTime,
  }) {
    return WaterModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      dateTime: dateTime ?? this.dateTime,
    );
  }
}