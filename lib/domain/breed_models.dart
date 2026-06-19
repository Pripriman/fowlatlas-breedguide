import 'breed_traits.dart';

enum BreedPurpose { eggLayer, meat, dualPurpose, ornamental }

extension PurposeMeta on BreedPurpose {
  String get label {
    switch (this) {
      case BreedPurpose.eggLayer:
        return 'Egg layer';
      case BreedPurpose.meat:
        return 'Meat';
      case BreedPurpose.dualPurpose:
        return 'Dual purpose';
      case BreedPurpose.ornamental:
        return 'Ornamental';
    }
  }
}

enum BreedSize { bantam, light, medium, heavy }

extension SizeMeta on BreedSize {
  String get label {
    switch (this) {
      case BreedSize.bantam:
        return 'Bantam';
      case BreedSize.light:
        return 'Light';
      case BreedSize.medium:
        return 'Medium';
      case BreedSize.heavy:
        return 'Heavy';
    }
  }
}

class BreedEntry {
  final String id;
  final String name;
  final String origin;
  final BreedPurpose purpose;
  final BreedSize size;
  final String eggColor;
  final int eggsPerYear;
  final double henWeightKg;
  final double roosterWeightKg;
  final Map<Trait, int> traits;
  final String summary;
  final String careTip;

  const BreedEntry({
    required this.id,
    required this.name,
    required this.origin,
    required this.purpose,
    required this.size,
    required this.eggColor,
    required this.eggsPerYear,
    required this.henWeightKg,
    required this.roosterWeightKg,
    required this.traits,
    required this.summary,
    required this.careTip,
  });

  int trait(Trait t) => traits[t] ?? 3;

  String get initials {
    final parts = name.split(RegExp(r'\s+')).where((p) => p.isNotEmpty);
    final letters = parts.take(2).map((p) => p[0].toUpperCase()).join();
    return letters.isEmpty ? '?' : letters;
  }
}
