// this class represents the score and the corresponding date and wether he passed the attempt or no
class ScoreEntry{
  final int score ;
  final String date ;
  final bool passed;

  ScoreEntry({
    required this.score,
    required this.date,
    required this.passed,
  });
}