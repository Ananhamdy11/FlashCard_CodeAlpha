import 'package:flutter/material.dart';
import 'package:flutter_application_1/feautres/home/presentation/views/widgets/quiz_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
      
         return Scaffold(
        appBar: AppBar(
          title: Text('FlashCard Quiz',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.blue,
        ),
        body:QuizViewBody()
        );
        
      
    
    
    
  }
}

 