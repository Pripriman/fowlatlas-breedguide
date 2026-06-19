import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../domain/breed_models.dart';
import '../domain/breed_traits.dart';
import '../theme/field_palette.dart';
import '../theme/field_type.dart';

class TraitRadar extends StatelessWidget {
  final List<BreedEntry> breeds;
  final List<Color> accents;

  const TraitRadar({
    super.key,
    required this.breeds,
    required this.accents,
  });

  @override
  Widget build(BuildContext context) {
    if (breeds.isEmpty) return const SizedBox.shrink();
    return AspectRatio(
      aspectRatio: 1,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          radarBackgroundColor: Colors.transparent,
          radarBorderData:
              const BorderSide(color: FieldPalette.hairline, width: 1),
          gridBorderData:
              const BorderSide(color: FieldPalette.hairline, width: 1),
          tickBorderData:
              const BorderSide(color: FieldPalette.hairline, width: 1),
          ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 0),
          tickCount: 5,
          titlePositionPercentageOffset: 0.16,
          getTitle: (index, angle) {
            final t = radarTraits[index % radarTraits.length];
            return RadarChartTitle(text: t.shortLabel);
          },
          titleTextStyle: FieldType.caption(color: FieldPalette.barkSoft),
          dataSets: [
            for (var i = 0; i < breeds.length; i++)
              _dataSet(breeds[i], accents[i % accents.length]),
          ],
        ),
      ),
    );
  }

  RadarDataSet _dataSet(BreedEntry b, Color color) {
    return RadarDataSet(
      fillColor: color.withValues(alpha: 0.16),
      borderColor: color,
      borderWidth: 2,
      entryRadius: 2.4,
      dataEntries: [
        for (final t in radarTraits) RadarEntry(value: b.trait(t).toDouble()),
      ],
    );
  }
}
