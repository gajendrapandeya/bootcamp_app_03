import 'package:flutter/foundation.dart';

class Category {
  Category({
    required this.id,
    required this.type,
    required this.truths,
    required this.dares,
  });

  final int id;
  final String type;
  final List<String> truths;
  final List<String> dares;

  String getIconPath() {
    switch (type) {
      case 'Funny':
        return 'assets/icons/funny.png';
      case 'Embarrassing':
        return 'assets/icons/embarrasing.png';
      case 'Romantic':
        return 'assets/icons/romantic.png';
      case 'Adventure':
        return 'assets/icons/adventure.png';
      case 'Foodie':
        return 'assets/icons/foodie.png';
      default:
        throw Exception('Asset not found');
    }
  }

  Category copyWith({
    int? id,
    String? type,
    List<String>? truths,
    List<String>? dares,
  }) {
    return Category(
      id: id ?? this.id,
      type: type ?? this.type,
      truths: truths ?? this.truths,
      dares: dares ?? this.dares,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'truths': truths,
      'dares': dares,
    };
  }

  @override
  String toString() {
    return 'Category(id: $id, type: $type, truths: $truths, dares: $dares)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.id == id && other.type == type && listEquals(other.truths, truths) && listEquals(other.dares, dares);
  }

  @override
  int get hashCode {
    return id.hashCode ^ type.hashCode ^ truths.hashCode ^ dares.hashCode;
  }
}

List<Category> categories = [
  Category(
    id: 1,
    type: "Funny",
    truths: [
      "What's the silliest thing you've ever done in public?",
      "Have you ever laughed so hard that you snorted?",
      "Tell a funny joke.",
      "What's the funniest YouTube video you've ever watched?",
      "Have you ever had an embarrassing wardrobe malfunction?"
    ],
    dares: [
      "Do your best impression of a chicken for 30 seconds.",
      "Wear your socks on your hands for the next round.",
      "Speak in a silly accent for the next 3 turns.",
      "Send a random funny emoji to someone in your contact list.",
      "Dance like nobody's watching for 1 minute.",
    ],
  ),
  Category(
    id: 2,
    type: "Embarrassing",
    truths: [
      "What's the most embarrassing thing that happened to you in school?",
      "Have you ever accidentally sent a text to the wrong person?",
      "Tell about a time you tripped and fell in public.",
      "What's the most embarrassing thing your parents caught you doing?",
      "Have you ever forgotten someone's name right after they told it to you?"
    ],
    dares: [
      "Call a friend and sing 'Happy Birthday' to them, even if it's not their birthday.",
      "Wear your clothes inside out for the next round.",
      "Tell a stranger a cringeworthy pickup line.",
      "Post an embarrassing childhood photo on social media.",
      "Do the chicken dance in a public place for 1 minute.",
    ],
  ),
  Category(
    id: 3,
    type: "Romantic",
    truths: [
      "What's the most romantic date you've ever been on?",
      "Have you ever written a love letter to someone?",
      "Describe your idea of a perfect romantic evening.",
      "Have you ever been in love?",
      "What's your favorite romantic movie?"
    ],
    dares: [
      "Write a short love poem on the spot and recite it.",
      "Share a romantic story from your own life.",
      "Send a sweet message to your crush or significant other.",
      "Ask someone for a slow dance, even if it's not a dance floor.",
      "Light a candle and create a romantic atmosphere."
    ],
  ),
  Category(
    id: 4,
    type: "Adventure",
    truths: [
      "What's the most adventurous thing you've ever done?",
      "Would you go skydiving or bungee jumping?",
      "Have you ever been on a spontaneous road trip?",
      "What's your dream travel destination?",
      "Have you ever gone camping in the wilderness?"
    ],
    dares: [
      "Plan a surprise outdoor adventure for a friend.",
      "Try an extreme sport or activity for the first time.",
      "Pack a backpack with essentials and go on an unplanned hike.",
      "Take a photo of something adventurous and share it with the group.",
      "Explore a new place in your city or town."
    ],
  ),
  Category(
    id: 5,
    type: "Foodie",
    truths: [
      "What's your favorite comfort food?",
      "Have you ever tried a bizarre food combination?",
      "Describe the best meal you've ever had.",
      "Do you enjoy cooking? What's your signature dish?",
      "What's the weirdest food you've ever tasted?"
    ],
    dares: [
      "Eat a spoonful of a spicy food item.",
      "Create a funny food-related TikTok video.",
      "Try a food you've never tasted before.",
      "Challenge a friend to a cooking competition.",
      "Make a dish using random ingredients from your kitchen."
    ],
  ),
];
