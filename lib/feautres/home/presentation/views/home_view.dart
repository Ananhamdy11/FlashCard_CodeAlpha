import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/addFlashCard_view.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlashCard App',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body:const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(
          builder: (context) => const AddflashcardView()
          )),
      child:const Icon(Icons.add),
      ),
    );
  }
}

 