import 'package:flutter/material.dart';
import 'package:learning_management_system/models/question.dart';


class Questions with ChangeNotifier {
  final List<Question> _items = [
    Question(
      id: '1',
      title: 'this is first catagory',
      description: 'math',
    ),
    Question(
      id: '2',
      title: 'this is second catagory',
      description: 'math ',
    ),
    Question(
      id: '3',
      title: 'this is third  catagory',
      description: 'math',
    ),
    Question(
      id: '4',
      title: 'this is fourth catagory',
      description: 'math',
    ),
    Question(
      id: '5',
      title: 'this is first catagory',
      description: 'math',
    )
  ];

  List<Question> get items {
    return [..._items];
  }

// Future<void> fetchHomeScreenData() async {
//   final url = Uri.https(
//       'https://quiz-94792-default-rtdb.firebaseio.com', '/mainQuiz.json');

//   try {
//     final response = await http.get(url);
//     var extractData = json.decode(response.body) as Map<String, dynamic>;
//     if (extractData == null) {
//       return;
//     }
//     final List<Question> loadedProduct = [];
//     extractData.forEach((prodId, prodData) {
//       loadedProduct.add(Question(
//         id: prodId,
//         description: prodData['description'],
//         title: prodData['title'],
//       ));
//     });

//     _items = loadedProduct;
//     notifyListeners();
//   } catch (error) {
//     rethrow;
//   }
// }

// Future<void> addMainQuestionCategory(Question question) {
//   final url = Uri.https(
//       'https://quiz-94792-default-rtdb.firebaseio.com', '/mainQuiz.json');
//   return http
//       .post(url,
//           body: json.encode({
//             'title': question.title,
//             'id': question.id,
//             'descriotion': question.description
//           }))
//       .then((response) {
//     // print(json.decode(response.body));
//     final newProdut = Question(
//         id: json.decode(response.body)['name'],
//         title: question.title,
//         description: question.description);
//     _items.add(newProdut);
//     notifyListeners();
//   }).catchError((error) {
//     throw error;
//   });
// }
}
