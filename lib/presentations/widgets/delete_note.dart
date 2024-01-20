import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/home_bloc.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';
import 'package:flutter/material.dart';

void deleteNote(BuildContext context, NotesModel note) {
  context.read<HomeBloc>().add(DeleteNote(id: note.key));
  Navigator.of(context).pop();
}
