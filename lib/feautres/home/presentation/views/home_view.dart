import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/addFlashCard_view.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlashCard App',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body:HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(
          builder: (context) => AddflashcardView()
          )),
      child: Icon(Icons.add),
      ),
    );
  }
}

 