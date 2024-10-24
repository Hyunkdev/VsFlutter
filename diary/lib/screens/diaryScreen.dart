import 'dart:async';
import 'package:diary/screens/diaryTextField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Diaryscreen extends StatefulWidget {
  final DateTime selectedDay;

  const Diaryscreen({
    super.key,
    required this.selectedDay,
  });

  @override
  State<Diaryscreen> createState() => _DiaryscreenState();
}

class _DiaryscreenState extends State<Diaryscreen> {
  final TextEditingController _controller = TextEditingController();
  String _savedText = ''; // 텍스트 저장
  Map<String, String> diaryEntries = {}; // 날짜와 내용을 저장할 맵

  @override
  void initState() {
    super.initState();
    _savedText = widget.selectedDay.toIso8601String();
    _loadDiaryEntry();
    _loadAllDiaryEntries(); // 모든 항목을 불러옴
  }

  Future<void> _loadDiaryEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? content = prefs.getString(_savedText);
    if (content != null) {
      _controller.text = content;
    }
  }

  Future<void> _saveDiaryEntry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_savedText, _controller.text); // 내용을 저장
    _loadAllDiaryEntries(); // 저장 후 목록을 다시 불러옴
  }

  Future<void> _loadAllDiaryEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      diaryEntries = prefs.getKeys().fold<Map<String, String>>({}, (map, key) {
        String? value = prefs.getString(key);
        if (value != null) {
          map[key] = value;
        }
        return map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu), // 메뉴 버튼
                onPressed: () {
                  Scaffold.of(context).openEndDrawer(); // Drawer 열기
                },
              );
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.diamond),
            const SizedBox(
              width: 20,
            ),
            Text(
              '${widget.selectedDay.month} / ${widget.selectedDay.day}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
      // Drawer에 저장된 일기 항목을 표시
      endDrawer: Drawer(
        child: ListView.builder(
          itemCount: diaryEntries.length,
          itemBuilder: (context, index) {
            String dateKey = diaryEntries.keys.elementAt(index);
            String content = diaryEntries[dateKey]!;

            DateTime date = DateTime.parse(dateKey);
            String formattedDate = '${date.year}-${date.month}-${date.day}';
            return ListTile(
              title: Text(formattedDate), // 날짜
              subtitle: Text(content), // 해당 날짜의 일기 내용
              onTap: () {
                Navigator.pop(context); // Drawer 닫기
                // 원하는 동작을 추가 (예: 해당 일기를 편집하거나 보기)
              },
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DiaryTextField(controller: _controller), // 다이어리
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 244, 212)),
              ),
              onPressed: _saveDiaryEntry,
              child: const Text(
                '저장',
                style: TextStyle(
                  fontFamily: 'MyCustomFont',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 메모리 해제를 위해 dispose
    super.dispose();
  }
}
