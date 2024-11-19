import 'package:flutter/foundation.dart';

class GridItemProvider with ChangeNotifier {
  final List<int> _selectedItems = [];

  List<int> get selectedItems => _selectedItems;

  void toggleSelection(int item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      _selectedItems.add(item);
    }
    notifyListeners();
  }
}
