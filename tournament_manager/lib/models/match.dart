class Match {
  final String id;
  final String tournamentId;
  final String participant1;
  final String participant2;
  final String? winner;
  final int? score1;
  final int? score2;
  final DateTime? scheduledDate;
  final String status;
  final String round;
  final Map<String, dynamic>? additionalData;

  Match({
    required this.id,
    required this.tournamentId,
    required this.participant1,
    required this.participant2,
    this.winner,
    this.score1,
    this.score2,
    this.scheduledDate,
    required this.status,
    required this.round,
    this.additionalData,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tournamentId': tournamentId,
      'participant1': participant1,
      'participant2': participant2,
      'winner': winner,
      'score1': score1,
      'score2': score2,
      'scheduledDate': scheduledDate?.toIso8601String(),
      'status': status,
      'round': round,
      'additionalData': additionalData,
    };
  }

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'] ?? '',
      tournamentId: map['tournamentId'] ?? '',
      participant1: map['participant1'] ?? '',
      participant2: map['participant2'] ?? '',
      winner: map['winner'],
      score1: map['score1'],
      score2: map['score2'],
      scheduledDate: map['scheduledDate'] != null
          ? DateTime.parse(map['scheduledDate'])
          : null,
      status: map['status'] ?? 'scheduled',
      round: map['round'] ?? '',
      additionalData: map['additionalData'],
    );
  }
}
