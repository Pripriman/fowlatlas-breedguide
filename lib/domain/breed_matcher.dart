import 'breed_catalog.dart';
import 'breed_models.dart';
import 'breed_traits.dart';

enum ClimatePref { cold, mild, hot }

enum SpacePref { compact, average, roomy }

enum GoalPref { eggs, meat, pets, ornamental }

enum NoisePref { quietNeeded, relaxed }

enum ExperiencePref { beginner, experienced }

class MatchQuery {
  final ClimatePref climate;
  final SpacePref space;
  final GoalPref goal;
  final NoisePref noise;
  final ExperiencePref experience;

  const MatchQuery({
    required this.climate,
    required this.space,
    required this.goal,
    required this.noise,
    required this.experience,
  });
}

class MatchResult {
  final BreedEntry breed;
  final double score;
  final List<String> reasons;
  const MatchResult(this.breed, this.score, this.reasons);

  int get percent => (score * 100).round().clamp(0, 100);
}

class BreedMatcher {
  static List<MatchResult> rank(MatchQuery q) {
    final scored = <MatchResult>[];
    for (final breed in BreedCatalog.all) {
      final result = _score(breed, q);
      scored.add(result);
    }
    scored.sort((a, b) => b.score.compareTo(a.score));
    return scored.take(8).toList();
  }

  static MatchResult _score(BreedEntry b, MatchQuery q) {
    double total = 0;
    double weight = 0;
    final reasons = <String>[];

    void add(double value, double w) {
      total += value * w;
      weight += w;
    }

    switch (q.climate) {
      case ClimatePref.cold:
        add(b.trait(Trait.coldHardiness) / 5, 1.4);
        if (b.trait(Trait.coldHardiness) >= 4) {
          reasons.add('Stands up to hard frost');
        }
        break;
      case ClimatePref.hot:
        add(b.trait(Trait.heatHardiness) / 5, 1.4);
        if (b.trait(Trait.heatHardiness) >= 4) {
          reasons.add('Handles heat well');
        }
        break;
      case ClimatePref.mild:
        add(((b.trait(Trait.coldHardiness) + b.trait(Trait.heatHardiness)) / 2) / 5,
            1.0);
        break;
    }

    switch (q.space) {
      case SpacePref.compact:
        final compact = b.size == BreedSize.bantam || b.size == BreedSize.light;
        add(compact ? 1.0 : 0.35, 1.0);
        add(b.trait(Trait.temperament) / 5, 0.6);
        if (compact) reasons.add('Compact for small plots');
        break;
      case SpacePref.average:
        add(0.7, 0.6);
        break;
      case SpacePref.roomy:
        add(b.trait(Trait.foraging) / 5, 1.0);
        if (b.trait(Trait.foraging) >= 4) {
          reasons.add('Thrives on open range');
        }
        break;
    }

    switch (q.goal) {
      case GoalPref.eggs:
        add(b.trait(Trait.eggYield) / 5, 1.5);
        if (b.eggsPerYear >= 250) {
          reasons.add('Lays ${b.eggsPerYear}+ eggs a year');
        }
        break;
      case GoalPref.meat:
        final meaty =
            b.size == BreedSize.heavy && b.purpose != BreedPurpose.eggLayer;
        add(meaty ? 1.0 : 0.4, 1.5);
        if (meaty) reasons.add('Heavy table breed');
        break;
      case GoalPref.pets:
        add(b.trait(Trait.childFriendly) / 5, 1.2);
        add(b.trait(Trait.temperament) / 5, 1.0);
        if (b.trait(Trait.childFriendly) >= 4) {
          reasons.add('Gentle family pet');
        }
        break;
      case GoalPref.ornamental:
        add(b.purpose == BreedPurpose.ornamental ? 1.0 : 0.45, 1.4);
        if (b.purpose == BreedPurpose.ornamental) {
          reasons.add('Striking show bird');
        }
        break;
    }

    if (q.noise == NoisePref.quietNeeded) {
      add(b.trait(Trait.noise) / 5, 1.1);
      if (b.trait(Trait.noise) >= 4) reasons.add('Quiet near neighbours');
    } else {
      add(0.7, 0.4);
    }

    if (q.experience == ExperiencePref.beginner) {
      add(b.trait(Trait.temperament) / 5, 0.9);
      final easy = b.trait(Trait.temperament) >= 4 &&
          b.trait(Trait.broodiness) <= 3;
      if (easy) reasons.add('Easy for beginners');
    } else {
      add(0.7, 0.3);
    }

    final score = weight == 0 ? 0.0 : (total / weight).clamp(0.0, 1.0);
    if (reasons.isEmpty) reasons.add('A balanced all-round choice');
    return MatchResult(b, score, reasons.take(3).toList());
  }
}
