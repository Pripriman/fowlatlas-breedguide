import 'package:flutter/material.dart';

import '../../domain/breed_matcher.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/breed_portrait.dart';
import '../../widgets/field_card.dart';
import '../../widgets/sprout_button.dart';
import 'breed_entry_view.dart';

class MatchQuizView extends StatefulWidget {
  const MatchQuizView({super.key});

  @override
  State<MatchQuizView> createState() => _MatchQuizViewState();
}

class _MatchQuizViewState extends State<MatchQuizView> {
  ClimatePref _climate = ClimatePref.mild;
  SpacePref _space = SpacePref.average;
  GoalPref _goal = GoalPref.eggs;
  NoisePref _noise = NoisePref.relaxed;
  ExperiencePref _experience = ExperiencePref.beginner;

  List<MatchResult>? _results;

  void _run() {
    final query = MatchQuery(
      climate: _climate,
      space: _space,
      goal: _goal,
      noise: _noise,
      experience: _experience,
    );
    setState(() => _results = BreedMatcher.rank(query));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      children: [
        FieldCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Find your breed', style: FieldType.heading()),
              const SizedBox(height: 6),
              Text(
                'Tell us about your conditions and we will rank the breeds that suit you best.',
                style: FieldType.body(),
              ),
              const SizedBox(height: 16),
              _question<ClimatePref>(
                'Your climate',
                _climate,
                {
                  ClimatePref.cold: 'Cold winters',
                  ClimatePref.mild: 'Mild',
                  ClimatePref.hot: 'Hot summers',
                },
                (v) => setState(() => _climate = v),
              ),
              _question<SpacePref>(
                'Available space',
                _space,
                {
                  SpacePref.compact: 'Compact',
                  SpacePref.average: 'Average',
                  SpacePref.roomy: 'Roomy range',
                },
                (v) => setState(() => _space = v),
              ),
              _question<GoalPref>(
                'Main goal',
                _goal,
                {
                  GoalPref.eggs: 'Eggs',
                  GoalPref.meat: 'Meat',
                  GoalPref.pets: 'Pets',
                  GoalPref.ornamental: 'Ornamental',
                },
                (v) => setState(() => _goal = v),
              ),
              _question<NoisePref>(
                'Noise tolerance',
                _noise,
                {
                  NoisePref.quietNeeded: 'Must stay quiet',
                  NoisePref.relaxed: 'Relaxed',
                },
                (v) => setState(() => _noise = v),
              ),
              _question<ExperiencePref>(
                'Your experience',
                _experience,
                {
                  ExperiencePref.beginner: 'Beginner',
                  ExperiencePref.experienced: 'Experienced',
                },
                (v) => setState(() => _experience = v),
              ),
              const SizedBox(height: 16),
              SproutButton(
                label: 'Show my matches',
                icon: Icons.auto_awesome_rounded,
                onPressed: _run,
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        if (_results != null) ...[
          Text('Your top matches', style: FieldType.label()),
          const SizedBox(height: 12),
          ..._results!.map(_matchTile),
        ],
      ],
    );
  }

  Widget _question<T>(
    String label,
    T value,
    Map<T, String> options,
    ValueChanged<T> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: FieldType.label(color: FieldPalette.barkSoft)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: options.entries.map((e) {
              final sel = e.key == value;
              return GestureDetector(
                onTap: () => onChanged(e.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
                  decoration: BoxDecoration(
                    color: sel ? FieldPalette.forestWash : FieldPalette.paper,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: sel ? FieldPalette.forest : FieldPalette.hairline,
                      width: sel ? 1.6 : 1,
                    ),
                  ),
                  child: Text(e.value,
                      style: FieldType.bodyStrong(
                          color: sel
                              ? FieldPalette.forestDeep
                              : FieldPalette.barkSoft)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _matchTile(MatchResult r) {
    final accent = FieldPalette.accentFor(r.breed.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (_) => BreedEntryView(breedId: r.breed.id)),
          ),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: FieldPalette.card,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: FieldPalette.hairline),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BreedPortrait(label: r.breed.initials, accent: accent, size: 56),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child:
                                Text(r.breed.name, style: FieldType.heading()),
                          ),
                          Text('${r.percent}%',
                              style: FieldType.numeral(18, color: accent)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      ...r.reasons.map((reason) => Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle_outline_rounded,
                                    size: 14, color: accent),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(reason,
                                      style: FieldType.caption(
                                          color: FieldPalette.barkSoft)),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
