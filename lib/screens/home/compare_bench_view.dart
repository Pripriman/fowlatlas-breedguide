import 'package:flutter/material.dart';

import '../../domain/breed_catalog.dart';
import '../../domain/breed_models.dart';
import '../../domain/breed_traits.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/breed_portrait.dart';
import '../../widgets/field_card.dart';
import '../../widgets/trait_radar.dart';

class CompareBenchView extends StatefulWidget {
  const CompareBenchView({super.key});

  @override
  State<CompareBenchView> createState() => _CompareBenchViewState();
}

class _CompareBenchViewState extends State<CompareBenchView> {
  final List<String> _selected = [];

  static const _accents = [
    FieldPalette.forest,
    FieldPalette.clay,
    FieldPalette.wheat,
  ];

  void _toggle(String id) {
    setState(() {
      if (_selected.contains(id)) {
        _selected.remove(id);
      } else if (_selected.length < 3) {
        _selected.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final chosen = _selected.map(BreedCatalog.byId).toList();
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
      children: [
        FieldCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Compare breeds', style: FieldType.heading()),
              const SizedBox(height: 6),
              Text(
                'Pick two or three breeds to overlay their traits on one radar chart.',
                style: FieldType.body(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        if (chosen.length >= 2) ...[
          FieldCard(
            child: Column(
              children: [
                TraitRadar(breeds: chosen, accents: _accents),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 14,
                  runSpacing: 6,
                  alignment: WrapAlignment.center,
                  children: [
                    for (var i = 0; i < chosen.length; i++)
                      _legend(chosen[i], _accents[i % _accents.length]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _comparisonTable(chosen),
          const SizedBox(height: 16),
        ] else
          FieldCard(
            color: FieldPalette.forestWash,
            border: Border.all(color: FieldPalette.forest),
            child: Row(
              children: [
                const Icon(Icons.insights_rounded,
                    color: FieldPalette.forestDeep),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Select at least two breeds below to see the comparison chart.',
                    style: FieldType.bodyStrong(color: FieldPalette.bark),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 8),
        Text('Pick breeds (${_selected.length}/3)', style: FieldType.label()),
        const SizedBox(height: 12),
        ...BreedCatalog.all.map(_pickTile),
      ],
    );
  }

  Widget _legend(BreedEntry b, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(b.name, style: FieldType.caption(color: FieldPalette.bark)),
      ],
    );
  }

  Widget _comparisonTable(List<BreedEntry> breeds) {
    return FieldCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Side by side', style: FieldType.heading()),
          const SizedBox(height: 12),
          for (final t in radarTraits) _row(t.shortLabel, breeds,
              (b) => '${b.trait(t)}/5'),
          _row('Eggs/yr', breeds, (b) => '${b.eggsPerYear}'),
          _row('Egg colour', breeds, (b) => b.eggColor),
        ],
      ),
    );
  }

  Widget _row(
      String label, List<BreedEntry> breeds, String Function(BreedEntry) val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 78,
            child: Text(label,
                style: FieldType.caption(color: FieldPalette.barkSoft)),
          ),
          for (var i = 0; i < breeds.length; i++)
            Expanded(
              child: Text(val(breeds[i]),
                  style: FieldType.bodyStrong(
                      color: _accents[i % _accents.length]),
                  textAlign: TextAlign.center),
            ),
        ],
      ),
    );
  }

  Widget _pickTile(BreedEntry b) {
    final accent = FieldPalette.accentFor(b.id);
    final selected = _selected.contains(b.id);
    final slot = _selected.indexOf(b.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => _toggle(b.id),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: selected ? FieldPalette.forestWash : FieldPalette.card,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: selected ? FieldPalette.forest : FieldPalette.hairline,
                width: selected ? 1.6 : 1,
              ),
            ),
            child: Row(
              children: [
                BreedPortrait(label: b.initials, accent: accent, size: 44),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(b.name, style: FieldType.bodyStrong()),
                      Text('${b.purpose.label} · ${b.eggsPerYear} eggs/yr',
                          style: FieldType.caption()),
                    ],
                  ),
                ),
                if (selected)
                  Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: _accents[slot % _accents.length],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.check_rounded,
                        size: 16, color: Colors.white),
                  )
                else
                  const Icon(Icons.add_circle_outline_rounded,
                      color: FieldPalette.barkFaint),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
