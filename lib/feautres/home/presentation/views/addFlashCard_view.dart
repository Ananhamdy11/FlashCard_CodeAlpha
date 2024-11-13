import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/widgets/add_flashcard_view_body.dart';

class AddflashcardView extends StatefulWidget {
  const AddflashcardView({super.key});

  @override
  State<AddflashcardView> createState() => _AddflashcardViewState();
}

class _AddflashcardViewState extends State<AddflashcardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Add Flashcard',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.blue,
      ),
      body: AddflashcardViewBody(),
    );
  }
}

