import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/home_bloc.dart';
import 'package:notes_app/core/enum.dart';
import 'package:notes_app/core/sizedbox.dart';
import 'package:notes_app/core/textstyle.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';
import 'package:notes_app/presentations/widgets/option_dialog.dart';

class NoteItemScreen extends StatelessWidget {
  const NoteItemScreen({Key? key, required this.note});

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // options button
          IconButton(
            tooltip: 'Options',
            onPressed: () {
              showOptions(context, note);
            },
            color: Color.fromARGB(255, 0, 0, 0),
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
  padding: const EdgeInsets.all(200),
  child: Card(
    elevation: 20, // a shadow effect
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), 
    ),
    color: Color(0xFFE1EDF8),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: titleFontStyle.copyWith(fontSize: 30),
          ),
          const SizedBox(height: 10), //  spacing between title and description
          const Divider(
            color: Colors.black,
          ),
          const Divider(
            color: Colors.black,
          ), // Divider line 
          Text(
            note.description,
            style: descFontStyle.copyWith(fontSize: 20),
          ),
        ],
      ),
    ),
  ),
),

    );
  }
}
