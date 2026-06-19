import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RosterRepository extends ChangeNotifier {
  static const _favKey = 'breed.favorites';
  static const _noteKey = 'breed.notes';

  final Set<String> _favorites = {};
  final Map<String, String> _notes = {};
  bool _loaded = false;

  bool get isLoaded => _loaded;
  Set<String> get favorites => Set.unmodifiable(_favorites);
  int get favoriteCount => _favorites.length;
  int get noteCount => _notes.values.where((n) => n.trim().isNotEmpty).length;

  bool isFavorite(String breedId) => _favorites.contains(breedId);
  String noteFor(String breedId) => _notes[breedId] ?? '';
  bool hasNote(String breedId) => (_notes[breedId] ?? '').trim().isNotEmpty;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final favRaw = prefs.getString(_favKey);
    final noteRaw = prefs.getString(_noteKey);
    _favorites.clear();
    _notes.clear();
    if (favRaw != null && favRaw.isNotEmpty) {
      try {
        final list = jsonDecode(favRaw) as List;
        for (final id in list) {
          if (id is String) _favorites.add(id);
        }
      } catch (_) {}
    }
    if (noteRaw != null && noteRaw.isNotEmpty) {
      try {
        final map = jsonDecode(noteRaw) as Map<String, dynamic>;
        map.forEach((k, v) {
          if (v is String) _notes[k] = v;
        });
      } catch (_) {}
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> toggleFavorite(String breedId) async {
    if (_favorites.contains(breedId)) {
      _favorites.remove(breedId);
    } else {
      _favorites.add(breedId);
    }
    await _persistFavorites();
    notifyListeners();
  }

  Future<void> setNote(String breedId, String note) async {
    final trimmed = note.trim();
    if (trimmed.isEmpty) {
      _notes.remove(breedId);
    } else {
      _notes[breedId] = trimmed;
    }
    await _persistNotes();
    notifyListeners();
  }

  Future<void> _persistFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_favKey, jsonEncode(_favorites.toList()));
  }

  Future<void> _persistNotes() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_noteKey, jsonEncode(_notes));
  }
}
