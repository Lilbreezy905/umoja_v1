import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class ConfirmStatusScreen extends ConsumerWidget {
   static const String routeName = "/confirm-status-screen";
   final File file;
  const ConfirmStatusScreen({super.key,required this.file});

  void addStatus(WidgetRef ref,BuildContext context){
        Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: 
        AspectRatio(aspectRatio: 9/16,
        child: Image.file(file),
        )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.background,
          onPressed: ()=>addStatus(ref, context),
          child: Icon(Icons.done,color: Theme.of(context).colorScheme.onBackground,) ,
          
          ),
    );
  }
}