import 'package:flutter/material.dart';

import '../../domain/breed_catalog.dart';
import '../../domain/breed_models.dart';
import '../../domain/breed_traits.dart';
import '../../state/roster_scope.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/breed_portrait.dart';
import '../../widgets/hardiness_badge.dart';
import 'breed_entry_view.dart';

class BreedRosterView extends StatefulWidget {
  const BreedRosterView({super.key});

  @override
  State<BreedRosterView> createState() => _BreedRosterViewState();
}

class _BreedRosterViewState extends State<BreedRosterView> {
  final _search = TextEditingController();
  String _query = '';
  BreedPurpose? _purpose;
  BreedSize? _size;
  bool _quietOnly = false;
  bool _coldOnly = false;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  List<BreedEntry> get _filtered {
    final q = _query.trim().toLowerCase();
    return BreedCatalog.all.where((b) {
      if (q.isNotEmpty &&
          !b.name.toLowerCase().contains(q) &&
          !b.origin.toLowerCase().contains(q)) {
        return false;
      }
      if (_purpose != null && b.purpose != _purpose) return false;
      if (_size != null && b.size != _size) return false;
      if (_quietOnly && b.trait(Trait.noise) < 4) return false;
      if (_coldOnly && b.trait(Trait.coldHardiness) < 4) return false;
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final roster = RosterScope.of(context);
    final breeds = _filtered;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: TextField(
            controller: _search,
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Search breeds or origin',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: _query.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () {
                        _search.clear();
                        setState(() => _query = '');
                      },
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 42,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              for (final p in BreedPurpose.values)
                _chip(p.label, _purpose == p,
                    () => setState(() => _purpose = _purpose == p ? null : p)),
              const SizedBox(width: 4),
              for (final s in BreedSize.values)
                _chip(s.label, _size == s,
                    () => setState(() => _size = _size == s ? null : s)),
              const SizedBox(width: 4),
              _chip('Quiet', _quietOnly,
                  () => setState(() => _quietOnly = !_quietOnly)),
              _chip('Cold hardy', _coldOnly,
                  () => setState(() => _coldOnly = !_coldOnly)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 6),
          child: Row(
            children: [
              Text('${breeds.length} breeds', style: FieldType.caption()),
            ],
          ),
        ),
        Expanded(
          child: breeds.isEmpty
              ? Center(
                  child: Text('No breeds match these filters.',
                      style: FieldType.body()),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 40),
                  itemCount: breeds.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, i) =>
                      _breedTile(roster, breeds[i]),
                ),
        ),
      ],
    );
  }

  Widget _chip(String label, bool selected, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? FieldPalette.forestDeep : FieldPalette.card,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: selected ? FieldPalette.forestDeep : FieldPalette.hairline,
            ),
          ),
          child: Text(
            label,
            style: FieldType.label(
                color: selected ? Colors.white : FieldPalette.barkSoft),
          ),
        ),
      ),
    );
  }

  Widget _breedTile(roster, BreedEntry b) {
    final accent = FieldPalette.accentFor(b.id);
    final fav = roster.isFavorite(b.id);
    return Material(
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
          child: Row(
            children: [
              BreedPortrait(label: b.initials, accent: accent, size: 58),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(b.name, style: FieldType.heading()),
                        ),
                        if (fav)
                          const Icon(Icons.bookmark_rounded,
                              size: 16, color: FieldPalette.clay),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text('${b.purpose.label} · ${b.eggColor} eggs · ${b.origin}',
                        style: FieldType.caption()),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        HardinessBadge(
                          label: '${b.eggsPerYear} eggs/yr',
                          color: FieldPalette.forest,
                          icon: Icons.egg_outlined,
                        ),
                        const SizedBox(width: 8),
                        HardinessBadge(
                          label: b.size.label,
                          color: accent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
