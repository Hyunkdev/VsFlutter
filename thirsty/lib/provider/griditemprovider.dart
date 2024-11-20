import 'package:flutter/foundation.dart';

class GridItemProvider with ChangeNotifier {
  final List<int> _selectedItems = [];
  final List<String> _images = [
    'assets/1.png', //<a href="https://www.flaticon.com/kr/free-icons/-" title="플라스틱 병 아이콘">플라스틱 병 아이콘 제작자: Kemalmoe - Flaticon</a>
    'assets/2.png', //<a href="https://www.flaticon.com/kr/free-icons/-" title="탄산 음료 아이콘">탄산 음료 아이콘 제작자: Smashicons - Flaticon</a>
    'assets/3.png', //<a href="https://www.flaticon.com/kr/free-icons/-" title="탄산 음료 아이콘">탄산 음료 아이콘 제작자: Freepik - Flaticon</a>
    'assets/4.png', //<a href="https://www.flaticon.com/kr/free-icons/" title="음료수 아이콘">음료수 아이콘 제작자: Freepik - Flaticon</a>
    'assets/5.png', //<a href="https://www.flaticon.com/kr/free-icons/-" title="청량 음료 아이콘">청량 음료 아이콘 제작자: Freepik - Flaticon</a>
  ];

  List<int> get selectedItems => _selectedItems;
  List<String> get images => _images;

  void toggleSelection(int item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      _selectedItems.add(item);
    }
    notifyListeners();
  }
}
