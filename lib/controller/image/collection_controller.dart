import 'package:flutter/material.dart';

import '../../data/const.dart';
import '../../data/image/image.dart';

class CollectionController extends ChangeNotifier {
  final List<MyImage> _images = kImageList;
  final List<MyImage> _collection = [];
  final List<MyImage> _emojis = [];

  List<MyImage> get myCollection => _collection;
  List<MyImage> get myImages => _images;
  List<MyImage> get myEmojis => _emojis;

  void add(MyImage image) {
    _collection.add(image);
    notifyListeners();
  }

  void remove(MyImage image) {
    _collection.remove(image);
    notifyListeners();
  }

  bool isMarked(MyImage image) {
    return _collection.contains(image);
  }

  void addEmoji(MyImage image) {
    _emojis.add(image);
    notifyListeners();
  }

  void removeEmoji(MyImage image) {
    _emojis.remove(image);
    notifyListeners();
  }

  bool emoji(MyImage image) {
    return _emojis.contains(image);
  }

  void removeAll() {
    _collection.clear();
    notifyListeners();
  }
}
