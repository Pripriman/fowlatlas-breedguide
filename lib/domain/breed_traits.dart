import 'package:flutter/material.dart';
import '../theme/field_palette.dart';

enum Trait {
  eggYield,
  coldHardiness,
  heatHardiness,
  temperament,
  broodiness,
  foraging,
  noise,
  childFriendly,
}

extension TraitMeta on Trait {
  String get label {
    switch (this) {
      case Trait.eggYield:
        return 'Egg yield';
      case Trait.coldHardiness:
        return 'Cold hardiness';
      case Trait.heatHardiness:
        return 'Heat hardiness';
      case Trait.temperament:
        return 'Calm temperament';
      case Trait.broodiness:
        return 'Broodiness';
      case Trait.foraging:
        return 'Foraging';
      case Trait.noise:
        return 'Quietness';
      case Trait.childFriendly:
        return 'Child friendly';
    }
  }

  String get shortLabel {
    switch (this) {
      case Trait.eggYield:
        return 'Eggs';
      case Trait.coldHardiness:
        return 'Cold';
      case Trait.heatHardiness:
        return 'Heat';
      case Trait.temperament:
        return 'Calm';
      case Trait.broodiness:
        return 'Brood';
      case Trait.foraging:
        return 'Forage';
      case Trait.noise:
        return 'Quiet';
      case Trait.childFriendly:
        return 'Kids';
    }
  }

  IconData get icon {
    switch (this) {
      case Trait.eggYield:
        return Icons.egg_outlined;
      case Trait.coldHardiness:
        return Icons.ac_unit_rounded;
      case Trait.heatHardiness:
        return Icons.wb_sunny_outlined;
      case Trait.temperament:
        return Icons.spa_outlined;
      case Trait.broodiness:
        return Icons.crib_outlined;
      case Trait.foraging:
        return Icons.grass_outlined;
      case Trait.noise:
        return Icons.volume_down_outlined;
      case Trait.childFriendly:
        return Icons.child_care_outlined;
    }
  }
}

const List<Trait> radarTraits = [
  Trait.eggYield,
  Trait.coldHardiness,
  Trait.heatHardiness,
  Trait.temperament,
  Trait.broodiness,
  Trait.foraging,
];

Color hardinessTint(int score) {
  if (score >= 4) return FieldPalette.robust;
  if (score == 3) return FieldPalette.watchful;
  return FieldPalette.tender;
}
