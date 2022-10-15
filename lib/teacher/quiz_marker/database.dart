import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  Future<void> addQuizData(Map<String,dynamic> quizData,String quizId) async{
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    await fireStore.collection('Quiz').doc(quizId).set(quizData)
        .catchError((e){
          print(e.toString());
    });
  }
}