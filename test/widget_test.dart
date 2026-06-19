import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:breedguide/domain/breed_catalog.dart';
import 'package:breedguide/domain/breed_matcher.dart';
import 'package:breedguide/domain/breed_traits.dart';
import 'package:breedguide/widgets/breed_portrait.dart';
import 'package:breedguide/theme/field_palette.dart';

void main() {
  testWidgets('BreedPortrait renders', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: BreedPortrait(label: 'RR', accent: FieldPalette.forest),
          ),
        ),
      ),
    );
    expect(find.byType(BreedPortrait), findsOneWidget);
  });

  test('catalog exposes known breeds', () {
    expect(BreedCatalog.byId('leghorn').origin, 'Italy');
    expect(BreedCatalog.byId('orpington').purpose.label, 'Dual purpose');
    expect(BreedCatalog.all.length, greaterThan(20));
  });

  test('matcher ranks cold-hardy egg layers first for cold egg goal', () {
    const query = MatchQuery(
      climate: ClimatePref.cold,
      space: SpacePref.average,
      goal: GoalPref.eggs,
      noise: NoisePref.relaxed,
      experience: ExperiencePref.beginner,
    );
    final results = BreedMatcher.rank(query);
    expect(results, isNotEmpty);
    expect(results.first.breed.trait(Trait.coldHardiness), greaterThanOrEqualTo(3));
    expect(results.first.percent, greaterThan(0));
  });
}
