class Tournament {
  final String id;
  final String name;
  final String sport;
  final String format;
  final List<String> participants;
  final DateTime createdAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final String status;
  final String? description;
  final Map<String, dynamic>? settings;

  Tournament({
    required this.id,
    required this.name,
    required this.sport,
    required this.format,
    required this.participants,
    required this.createdAt,
    this.startDate,
    this.endDate,
    required this.status,
    this.description,
    this.settings,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sport': sport,
      'format': format,
      'participants': participants,
      'createdAt': createdAt.toIso8601String(),
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'status': status,
      'description': description,
      'settings': settings,
    };
  }

  factory Tournament.fromMap(Map<String, dynamic> map) {
    return Tournament(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      sport: map['sport'] ?? '',
      format: map['format'] ?? '',
      participants: List<String>.from(map['participants'] ?? []),
      createdAt: DateTime.parse(map['createdAt']),
      startDate: map['startDate'] != null
          ? DateTime.parse(map['startDate'])
          : null,
      endDate: map['endDate'] != null ? DateTime.parse(map['endDate']) : null,
      status: map['status'] ?? 'upcoming',
      description: map['description'],
      settings: map['settings'],
    );
  }

  Tournament copyWith({
    String? id,
    String? name,
    String? sport,
    String? format,
    List<String>? participants,
    DateTime? createdAt,
    DateTime? startDate,
    DateTime? endDate,
    String? status,
    String? description,
    Map<String, dynamic>? settings,
  }) {
    return Tournament(
      id: id ?? this.id,
      name: name ?? this.name,
      sport: sport ?? this.sport,
      format: format ?? this.format,
      participants: participants ?? this.participants,
      createdAt: createdAt ?? this.createdAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      description: description ?? this.description,
      settings: settings ?? this.settings,
    );
  }
}
