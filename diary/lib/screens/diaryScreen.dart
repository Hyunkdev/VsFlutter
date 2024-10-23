import 'package:diary/models/diary_model.dart';
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
  String _savedText = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _savedText = widget.selectedDay.toIso8601String();
    _loadDiaryEntry();
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
    _controller.clear(); // 입력 필드 초기화
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          TextField(
            maxLength: 50,
            controller: _controller,
          ),
          ElevatedButton(
            onPressed: _saveDiaryEntry,
            child: const Text('저장'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // 메모리 해제를 위해 dispose
    super.dispose();
  }
}
