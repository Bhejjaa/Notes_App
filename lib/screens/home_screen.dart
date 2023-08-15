import 'package:flutter/material.dart';
import 'package:notes_app/models/NotesOperation.dart';
import 'package:notes_app/screens/add_screen.dart';
import 'package:provider/provider.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import '../models/Note.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, // Changed background color to teal
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        backgroundColor: Colors.orange, // Changed FAB background color to orange
      ),
      appBar: AppBar(
        title: Text('Notes'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange, // Changed app bar background color to orange
      ),
      body: Consumer<NotesOperation>(
        builder: (context, NotesOperation data, child) {
          return ListView.builder(
              itemCount: data.getNotes.length,
              itemBuilder: (context, index) {
                return NotesCard(data.getNotes[index]);
              });
        },
      ),
    );
  }
}

class NotesCard extends StatelessWidget {
  final Note note;

  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: ((context) => AddScreen())),
        );
      },
      child: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.orange, // Changed card color to orange
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              note.description,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
