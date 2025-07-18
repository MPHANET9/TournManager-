class Participant {
  final String id;
  final String name;
  final String type; // 'team' or 'individual'
  final String sport;
  final Map<String, dynamic>? stats;
  final String? imageUrl;
  final DateTime createdAt;

  Participant({
    required this.id,
    required this.name,
    required this.type,
    required this.sport,
    this.stats,
    this.imageUrl,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'sport': sport,
      'stats': stats,
      'imageUrl': imageUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Participant.fromMap(Map<String, dynamic> map) {
    return Participant(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      type: map['type'] ?? 'team',
      sport: map['sport'] ?? '',
      stats: map['stats'],
      imageUrl: map['imageUrl'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
