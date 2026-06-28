class WaterModel {
  final int? id;
  final int amount; // in ml
  final String date;

  const WaterModel({
    this.id,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'date': date,
    };
  }

  factory WaterModel.fromMap(Map<String, dynamic> map) {
    return WaterModel(
      id: map['id'],
      amount: map['amount'],
      date: map['date'],
    );
  }
}