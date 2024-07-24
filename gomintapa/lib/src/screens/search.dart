import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('검색'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: '검색어 입력',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      _searchQuery = _searchController.text;
                      // 실제 검색 로직 추가
                    });
                  },
                ),
              ),
              onSubmitted: (query) {
                setState(() {
                  _searchQuery = query;
                  // 실제 검색 로직 추가
                });
              },
            ),
          ),
          // 검색 결과 표시 (여기서는 단순히 텍스트로 표시)
          Expanded(
            child: Center(
              child: Text('검색어: $_searchQuery'),
            ),
          ),
        ],
      ),
    );
  }
}
