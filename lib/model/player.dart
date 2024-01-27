class Player {
  String name;
  int points;
  int truthsCompleted;
  int daresCompleted;
  int giveUps;

  Player({
    required this.name,
    this.points = 0,
    this.truthsCompleted = 0,
    this.daresCompleted = 0,
    this.giveUps = 0,
  });

  void completedTruths() {
    points += 1;
    truthsCompleted += 1;
  }

  void completedDares() {
    points += 1;
    daresCompleted += 1;
  }

  void gaveUps() {
    giveUps += 1;
  }

  @override
  String toString() {
    return 'Player(name: $name, points: $points, truthsCompleted: $truthsCompleted, daresCompleted: $daresCompleted, giveUps: $giveUps)';
  }
}
