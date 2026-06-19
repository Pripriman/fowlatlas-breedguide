import 'package:flutter/widgets.dart';
import '../domain/roster_repository.dart';

class RosterScope extends InheritedNotifier<RosterRepository> {
  const RosterScope({
    super.key,
    required RosterRepository roster,
    required super.child,
  }) : super(notifier: roster);

  static RosterRepository of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<RosterScope>();
    assert(scope != null, 'RosterScope not found in context');
    return scope!.notifier!;
  }

  static RosterRepository read(BuildContext context) {
    final scope = context
        .getElementForInheritedWidgetOfExactType<RosterScope>()
        ?.widget as RosterScope?;
    return scope!.notifier!;
  }
}
