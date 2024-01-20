import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/bloc/home_bloc.dart';
import 'package:notes_app/core/textstyle.dart';
import 'package:notes_app/domain/home/model/notes_model.dart';
import 'package:notes_app/presentations/widgets/note_item_screen.dart';
import 'package:notes_app/presentations/widgets/notes_form_screen.dart';
import 'package:notes_app/presentations/widgets/search_bar.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  final dummyText = 'Hi';
  final title = 'Hello';
  final description = 'How Are Your';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(const GetNotes());
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes',
        style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //
          },
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                //
              },
              color: Color.fromARGB(255, 11, 93, 170),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            MySearchBar(),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return GridView.count(
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    crossAxisCount: 2,
                    childAspectRatio: 3.9,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,

                    children: List.generate(
                      state.notesModelList.length,
                      (index) {
                        return NoteItemCard(
                          note: state.notesModelList[index],
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // goto note_form_screen
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return NotesFormScreen();
          }
          
          ),
        );
        },
        backgroundColor: Color(0xFF043E72),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// note item widget
class NoteItemCard extends StatelessWidget {
  const NoteItemCard({
    super.key,
    required this.note,
  });

  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return NoteItemScreen(note: note);
        }));
      },
      child: Card(
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.black26),
            borderRadius: BorderRadius.circular(30)),
        color: Color(0xFFE1EDF8),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child:
              Text(
                '${DateFormat('dd MMMM,yyyy').format(note.date).toUpperCase()}',
                style:const TextStyle(
                  color: Color.fromARGB(255, 56, 55, 55),
                ),
              ),
              ),
              Text(
                note.title,
                style: titleFontStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                note.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: descFontStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
