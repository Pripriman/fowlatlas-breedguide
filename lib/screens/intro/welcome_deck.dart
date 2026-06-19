import 'package:flutter/material.dart';
import '../../theme/field_palette.dart';
import '../../theme/field_type.dart';
import '../../widgets/sprout_button.dart';

class _Leaf {
  final IconData icon;
  final String title;
  final String body;
  final Color accent;
  const _Leaf(this.icon, this.title, this.body, this.accent);
}

class WelcomeDeck extends StatefulWidget {
  final VoidCallback onDone;
  const WelcomeDeck({super.key, required this.onDone});

  @override
  State<WelcomeDeck> createState() => _WelcomeDeckState();
}

class _WelcomeDeckState extends State<WelcomeDeck> {
  final _controller = PageController();
  int _index = 0;

  static const _leaves = [
    _Leaf(Icons.menu_book_outlined, 'A field guide for your flock',
        'Browse a clear compendium of chicken breeds with honest trait meters for laying, hardiness, temperament and more.',
        FieldPalette.forest),
    _Leaf(Icons.tune_rounded, 'Find your breed',
        'Answer a few quick questions about your climate, space, goal and noise tolerance, and get a ranked shortlist made for you.',
        FieldPalette.clay),
    _Leaf(Icons.insights_outlined, 'Compare side by side',
        'Lay two or three breeds over one radar chart and instantly see who lays more, stays calmer or shrugs off the cold.',
        FieldPalette.wheat),
    _Leaf(Icons.bookmark_added_outlined, 'Keep your favourites',
        'Save the breeds you love and jot private notes — a breeder price, where you saw them, your own impressions.',
        FieldPalette.forestDeep),
  ];

  bool get _last => _index == _leaves.length - 1;

  void _next() {
    if (_last) {
      widget.onDone();
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 360),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: FieldPalette.meadowGradient),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, top: 4),
                  child: AnimatedOpacity(
                    opacity: _last ? 0 : 1,
                    duration: const Duration(milliseconds: 200),
                    child: QuietLink(
                      label: 'Skip',
                      onPressed: _last ? null : widget.onDone,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _leaves.length,
                  onPageChanged: (i) => setState(() => _index = i),
                  itemBuilder: (context, i) {
                    final leaf = _leaves[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 156,
                            height: 156,
                            decoration: BoxDecoration(
                              color: FieldPalette.card,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: leaf.accent.withValues(alpha: 0.5),
                                  width: 2.5),
                              boxShadow: [
                                BoxShadow(
                                  color: leaf.accent.withValues(alpha: 0.16),
                                  blurRadius: 28,
                                  offset: const Offset(0, 14),
                                ),
                              ],
                            ),
                            child: Icon(leaf.icon,
                                size: 60, color: leaf.accent),
                          ),
                          const SizedBox(height: 40),
                          Text(leaf.title,
                              style: FieldType.title(),
                              textAlign: TextAlign.center),
                          const SizedBox(height: 14),
                          Text(leaf.body,
                              style: FieldType.body(),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_leaves.length, (i) {
                  final active = i == _index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: active
                          ? FieldPalette.forest
                          : FieldPalette.hairline,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 24, 32, 28),
                child: SproutButton(
                  label: _last ? 'Open the guide' : 'Next',
                  onPressed: _next,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
