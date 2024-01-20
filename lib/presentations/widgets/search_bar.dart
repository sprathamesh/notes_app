import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // not yet implemented
            },
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
        ),
      ),
    );
  }
}