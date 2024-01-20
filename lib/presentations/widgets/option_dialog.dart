import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';
import 'package:notes_app/presentations/widgets/delete_note.dart';
import 'package:notes_app/presentations/widgets/edit_note.dart';
import 'package:notes_app/presentations/widgets/notes_form_screen.dart';
import 'package:notes_app/core/enum.dart';
import 'package:notes_app/bloc/home_bloc.dart';


void showOptions(BuildContext context, NotesModel note) {
  final RenderBox overlay =
      Overlay.of(context)!.context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  showMenu(
    context: context,
    position: RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(button.size.width, 0), ancestor: overlay),
        button.localToGlobal(Offset(button.size.width, button.size.height),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    ),
    items: [
      PopupMenuItem(
        onTap: () {
          Navigator.pop(context); // Close the menu
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => NotesFormScreen(
                type: ActionType.editNote,
                note: note,
              ),
            ),
          );
        },
        child: const ListTile(
          leading: Icon(Icons.edit),
        ),
      ),
      PopupMenuItem(
        onTap: () {
          context.read<HomeBloc>().add(DeleteNote(id: note.key));
          Navigator.of(context).pop();
        },
        child: const ListTile(
          leading: Icon(Icons.delete),
        ),
      ),
    ],
  );
}
