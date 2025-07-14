import 'package:flutter/material.dart';

class SearchBarScaffold extends StatelessWidget {
  const SearchBarScaffold({
    required this.controller,
    required this.onSearchSubmitted,
    super.key,
    this.leading,
    this.actions,
    this.body,
    this.searchBar,
    this.placeHolder = 'Search',
  });

  final List<Widget>? actions;
  final Widget? body;
  final Widget? leading;
  final Widget? searchBar;
  final String? placeHolder;
  final TextEditingController controller;
  final ValueChanged<String> onSearchSubmitted;

  Widget _buildDefaultSearchBar() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 250),
      child: TextField(
        style: TextStyle(fontSize: 14),
        controller: controller,
        cursorHeight: 16,
        cursorColor: Colors.black54,
        onSubmitted: (String value) => onSearchSubmitted(value),
        decoration: InputDecoration(
          suffixIcon: InkWell(
            radius: 12,
            onTap: () => onSearchSubmitted(controller.text.trim()),
            child: Icon(Icons.search),
          ),
          hintFadeDuration: const Duration(milliseconds: 600),
          hintText: placeHolder,
          hintStyle: TextStyle(color: Colors.black.withValues(alpha: 140)),
          isDense: true,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
          fillColor: Colors.black.withValues(alpha: .04),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultLeadingButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(4),
        actions: actions,
        leading: leading ?? _buildDefaultLeadingButton(context),
        title: searchBar ?? _buildDefaultSearchBar(),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
