import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/home_bloc.dart';
import 'package:notes_app/core/enum.dart';
import 'package:notes_app/presentations/widgets/notes_form_screen.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';

void editNote(BuildContext context, NotesModel note) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (ctx) => NotesFormScreen(
        type: ActionType.editNote,
        note: note,
      ),
    ),
  );
}
