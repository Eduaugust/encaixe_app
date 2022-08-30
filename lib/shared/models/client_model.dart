import 'dart:convert';

class ClientModel {
  final String? name;
  final String? number;
  final String? service;
  final bool? morning;
  final bool? afternoon;
  final String? start;
  final String? end;
  final bool? tuesday;
  final bool? wednesday;
  final bool? thursday;
  final bool? friday;
  final bool? saturday;
  final int? userId;
  ClientModel({
    this.name,
    this.number,
    this.service,
    this.morning,
    this.afternoon,
    this.start,
    this.end,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.userId,
  });

  ClientModel copyWith({
    String? name,
    String? number,
    String? service,
    bool? morning,
    bool? afternoon,
    String? start,
    String? end,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
    int? userId,
  }) {
    return ClientModel(
      name: name ?? this.name,
      number: number ?? this.number,
      service: service ?? this.service,
      morning: morning ?? this.morning,
      afternoon: afternoon ?? this.afternoon,
      start: start ?? this.start,
      end: end ?? this.end,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'service': service,
      'morning': morning,
      'afternoon': afternoon,
      'start': start,
      'end': end,
      'tuesday': tuesday,
      'wednesday': wednesday,
      'thursday': thursday,
      'friday': friday,
      'saturday': saturday,
      'userId': userId,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      name: map['name'],
      number: map['number'],
      service: map['service'],
      morning: map['morning'],
      afternoon: map['afternoon'],
      start: map['start'],
      end: map['end'],
      tuesday: map['tuesday'],
      wednesday: map['wednesday'],
      thursday: map['thursday'],
      friday: map['friday'],
      saturday: map['saturday'],
      userId: map['userId']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClientModel(name: $name, number: $number, service: $service, morning: $morning, afternoon: $afternoon, start: $start, end: $end, tuesday: $tuesday, wednesday: $wednesday, thursday: $thursday, friday: $friday, saturday: $saturday, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClientModel &&
        other.name == name &&
        other.number == number &&
        other.service == service &&
        other.morning == morning &&
        other.afternoon == afternoon &&
        other.start == start &&
        other.end == end &&
        other.tuesday == tuesday &&
        other.wednesday == wednesday &&
        other.thursday == thursday &&
        other.friday == friday &&
        other.saturday == saturday &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        number.hashCode ^
        service.hashCode ^
        morning.hashCode ^
        afternoon.hashCode ^
        start.hashCode ^
        end.hashCode ^
        tuesday.hashCode ^
        wednesday.hashCode ^
        thursday.hashCode ^
        friday.hashCode ^
        saturday.hashCode ^
        userId.hashCode;
  }
}
