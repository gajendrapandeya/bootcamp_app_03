import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'points': points,
      'truthsCompleted': truthsCompleted,
      'daresCompleted': daresCompleted,
      'giveUps': giveUps,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'] as String,
      points: map['points'] as int,
      truthsCompleted: map['truthsCompleted'] as int,
      daresCompleted: map['daresCompleted'] as int,
      giveUps: map['giveUps'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source) as Map<String, dynamic>);
}
