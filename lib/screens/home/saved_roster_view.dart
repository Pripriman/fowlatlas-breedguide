import 'package:flutter/material.dart';

import '../../domain/breed_catalog.dart';
import '../../domain/breed_models.dart';
import '../../domain/roster_repository.dart';
import '../../state/roster_scope.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/breed_portrait.dart';
import '../../widgets/field_card.dart';
import 'breed_entry_view.dart';

class SavedRosterView extends StatelessWidget {
  const SavedRosterView({super.key});

  @override
  Widget build(BuildContext context) {
    final roster = RosterScope.of(context);
    final favorites = BreedCatalog.all
        .where((b) => roster.isFavorite(b.id))
        .toList();
    final notedOnly = BreedCatalog.all
        .where((b) => roster.hasNote(b.id) && !roster.isFavorite(b.id))
        .toList();

    if (favorites.isEmpty && notedOnly.isEmpty) {
      return _empty();
    }

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
      children: [
        _summary(roster, favorites.length),
        const SizedBox(height: 18),
        if (favorites.isNotEmpty) ...[
          Text('Favourites', style: FieldType.label()),
          const SizedBox(height: 12),
          ...favorites.map((b) => _tile(context, roster, b)),
        ],
        if (notedOnly.isNotEmpty) ...[
          const SizedBox(height: 8),
          Text('Other breeds with notes', style: FieldType.label()),
          const SizedBox(height: 12),
          ...notedOnly.map((b) => _tile(context, roster, b)),
        ],
      ],
    );
  }

  Widget _summary(RosterRepository roster, int favCount) {
    return FieldCard(
      child: Row(
        children: [
          _stat('$favCount', 'favourites', Icons.bookmark_rounded,
              FieldPalette.clay),
          Container(
            width: 1,
            height: 44,
            color: FieldPalette.hairline,
            margin: const EdgeInsets.symmetric(horizontal: 16),
          ),
          _stat('${roster.noteCount}', 'notes', Icons.edit_note_rounded,
              FieldPalette.forest),
        ],
      ),
    );
  }

  Widget _stat(String value, String label, IconData icon, Color color) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: FieldType.numeral(22, color: FieldPalette.bark)),
              Text(label, style: FieldType.caption()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tile(BuildContext context, RosterRepository roster, BreedEntry b) {
    final accent = FieldPalette.accentFor(b.id);
    final note = roster.noteFor(b.id);
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => BreedEntryView(breedId: b.id)),
          ),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: FieldPalette.card,
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: FieldPalette.hairline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    BreedPortrait(label: b.initials, accent: accent, size: 50),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(b.name, style: FieldType.heading()),
                          const SizedBox(height: 2),
                          Text('${b.purpose.label} · ${b.eggsPerYear} eggs/yr',
                              style: FieldType.caption()),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        roster.isFavorite(b.id)
                            ? Icons.bookmark_rounded
                            : Icons.bookmark_border_rounded,
                        color: accent,
                      ),
                      onPressed: () => roster.toggleFavorite(b.id),
                    ),
                  ],
                ),
                if (note.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: FieldPalette.paper,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.edit_note_rounded,
                            size: 16, color: FieldPalette.barkFaint),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(note, style: FieldType.body()),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _empty() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bookmark_border_rounded,
                size: 64, color: FieldPalette.barkFaint),
            const SizedBox(height: 20),
            Text('Nothing saved yet', style: FieldType.title()),
            const SizedBox(height: 10),
            Text(
              'Open a breed and tap the bookmark to save it here, or add a private note to keep track of your shortlist.',
              style: FieldType.body(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
