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
      id: map['id'] as int?,
      amount: map['amount'] as int,
      dateTime: DateTime.parse(map['dateTime'] as String),
    );
  }
}