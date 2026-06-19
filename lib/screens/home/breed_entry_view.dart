import 'package:flutter/material.dart';

import '../../domain/breed_catalog.dart';
import '../../domain/breed_models.dart';
import '../../domain/breed_traits.dart';
import '../../state/roster_scope.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/breed_portrait.dart';
import '../../widgets/field_card.dart';
import '../../widgets/hardiness_badge.dart';
import '../../widgets/trait_meter.dart';

class BreedEntryView extends StatelessWidget {
  final String breedId;
  const BreedEntryView({super.key, required this.breedId});

  @override
  Widget build(BuildContext context) {
    final b = BreedCatalog.byId(breedId);
    final accent = FieldPalette.accentFor(b.id);
    final roster = RosterScope.of(context);
    final fav = roster.isFavorite(b.id);

    return Scaffold(
      backgroundColor: FieldPalette.paper,
      appBar: AppBar(
        title: Text(b.name, style: FieldType.title()),
        actions: [
          IconButton(
            icon: Icon(fav ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                color: accent),
            onPressed: () => roster.toggleFavorite(b.id),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.alphaBlend(
                      accent.withValues(alpha: 0.16), FieldPalette.card),
                  FieldPalette.card,
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: accent.withValues(alpha: 0.35)),
            ),
            child: Row(
              children: [
                BreedPortrait(label: b.initials, accent: accent, size: 84),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(b.name, style: FieldType.title()),
                      const SizedBox(height: 4),
                      Text('${b.purpose.label} · ${b.origin}',
                          style: FieldType.caption(color: FieldPalette.barkSoft)),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          HardinessBadge(
                            label: '${b.eggsPerYear} eggs/yr',
                            color: accent,
                            icon: Icons.egg_outlined,
                          ),
                          HardinessBadge(
                            label: '${b.eggColor} eggs',
                            color: FieldPalette.barkSoft,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FieldCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About this breed', style: FieldType.heading()),
                const SizedBox(height: 8),
                Text(b.summary, style: FieldType.body()),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FieldCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trait profile', style: FieldType.heading()),
                const SizedBox(height: 8),
                for (final t in Trait.values)
                  TraitMeter(trait: t, score: b.trait(t), accent: accent),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FieldCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('At a glance', style: FieldType.heading()),
                const SizedBox(height: 12),
                _spec('Size', b.size.label),
                _spec('Hen weight', '${b.henWeightKg.toStringAsFixed(1)} kg'),
                _spec('Rooster weight',
                    '${b.roosterWeightKg.toStringAsFixed(1)} kg'),
                _spec('Egg colour', b.eggColor),
                _spec('Eggs per year', '${b.eggsPerYear}'),
                _spec('Origin', b.origin),
              ],
            ),
          ),
          const SizedBox(height: 16),
          FieldCard(
            color: Color.alphaBlend(
                accent.withValues(alpha: 0.08), FieldPalette.card),
            border: Border.all(color: accent.withValues(alpha: 0.3)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.tips_and_updates_outlined, color: accent, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Keeper tip', style: FieldType.label(color: accent)),
                      const SizedBox(height: 4),
                      Text(b.careTip, style: FieldType.body()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _NoteCard(breed: b, accent: accent),
          const SizedBox(height: 16),
          Text(
            'This guide is informational and does not replace advice from a qualified veterinarian on bird health and welfare.',
            style: FieldType.caption(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _spec(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(label,
                style: FieldType.body(color: FieldPalette.barkSoft)),
          ),
          Text(value, style: FieldType.bodyStrong()),
        ],
      ),
    );
  }
}

class _NoteCard extends StatefulWidget {
  final BreedEntry breed;
  final Color accent;
  const _NoteCard({required this.breed, required this.accent});

  @override
  State<_NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<_NoteCard> {
  late final TextEditingController _controller;
  bool _editing = false;

  @override
  void initState() {
    super.initState();
    final roster = RosterScope.read(context);
    _controller = TextEditingController(text: roster.noteFor(widget.breed.id));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roster = RosterScope.of(context);
    final saved = roster.noteFor(widget.breed.id);
    return FieldCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.edit_note_rounded, color: FieldPalette.barkSoft),
              const SizedBox(width: 8),
              Text('My notes', style: FieldType.heading()),
              const Spacer(),
              if (!_editing)
                TextButton(
                  onPressed: () => setState(() => _editing = true),
                  child: Text(saved.isEmpty ? 'Add' : 'Edit',
                      style: FieldType.label(color: widget.accent)),
                ),
            ],
          ),
          const SizedBox(height: 8),
          if (_editing) ...[
            TextField(
              controller: _controller,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Breeder price, where you saw them, impressions…',
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.text = saved;
                    setState(() => _editing = false);
                  },
                  child: Text('Cancel', style: FieldType.label()),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: widget.accent),
                  onPressed: () async {
                    await roster.setNote(widget.breed.id, _controller.text);
                    if (mounted) setState(() => _editing = false);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ] else
            Text(
              saved.isEmpty ? 'No notes yet for this breed.' : saved,
              style: saved.isEmpty
                  ? FieldType.body(color: FieldPalette.barkFaint)
                  : FieldType.body(),
            ),
        ],
      ),
    );
  }
}
