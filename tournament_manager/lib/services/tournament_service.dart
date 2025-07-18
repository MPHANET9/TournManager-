import '../models/tournament.dart';
import '../models/match.dart';
import '../utils/constants.dart';
import 'package:uuid/uuid.dart';

class TournamentService {
  static const _uuid = Uuid();

  static List<Match> generateLeagueMatches(Tournament tournament) {
    final matches = <Match>[];
    final participants = tournament.participants;

    for (int i = 0; i < participants.length; i++) {
      for (int j = i + 1; j < participants.length; j++) {
        final match = Match(
          id: _uuid.v4(),
          tournamentId: tournament.id,
          participant1: participants[i],
          participant2: participants[j],
          status: 'scheduled',
          round: 'Regular Season',
        );
        matches.add(match);
      }
    }

    return matches;
  }

  static List<Match> generateKnockoutMatches(Tournament tournament) {
    final matches = <Match>[];
    final participants = List<String>.from(tournament.participants);

    // Shuffle participants for random bracket
    participants.shuffle();

    int roundNumber = 1;
    List<String> currentRound = participants;

    while (currentRound.length > 1) {
      final nextRound = <String>[];
      final roundName = _getRoundName(currentRound.length);

      for (int i = 0; i < currentRound.length; i += 2) {
        if (i + 1 < currentRound.length) {
          final match = Match(
            id: _uuid.v4(),
            tournamentId: tournament.id,
            participant1: currentRound[i],
            participant2: currentRound[i + 1],
            status: 'scheduled',
            round: roundName,
          );
          matches.add(match);
          nextRound.add('Winner of ${match.id}');
        } else {
          // Bye
          nextRound.add(currentRound[i]);
        }
      }

      currentRound = nextRound;
      roundNumber++;
    }

    return matches;
  }

  static String _getRoundName(int participantCount) {
    switch (participantCount) {
      case 2:
        return 'Final';
      case 4:
        return 'Semi-Final';
      case 8:
        return 'Quarter-Final';
      case 16:
        return 'Round of 16';
      case 32:
        return 'Round of 32';
      default:
        return 'Round ${participantCount ~/ 2}';
    }
  }

  static List<Match> generateGroupKnockoutMatches(Tournament tournament) {
    // This would implement group stage followed by knockout
    // For now, return empty list - would need more complex logic
    return [];
  }

  static bool validateTournamentFormat(Tournament tournament) {
    switch (tournament.format) {
      case AppConstants.leagueFormat:
        return tournament.participants.length >= 3;
      case AppConstants.knockoutFormat:
        return tournament.participants.length >= 2;
      case AppConstants.groupKnockoutFormat:
        return tournament.participants.length >= 8;
      default:
        return false;
    }
  }

  static int calculateTotalMatches(Tournament tournament) {
    switch (tournament.format) {
      case AppConstants.leagueFormat:
        final n = tournament.participants.length;
        return (n * (n - 1)) ~/ 2;
      case AppConstants.knockoutFormat:
        return tournament.participants.length - 1;
      case AppConstants.groupKnockoutFormat:
        // Simplified calculation
        return tournament.participants.length +
            (tournament.participants.length ~/ 2);
      default:
        return 0;
    }
  }
}
