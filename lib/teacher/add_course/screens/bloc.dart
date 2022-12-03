import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:learning_management_system/teacher/add_course/screens/state.dart';
import 'event.dart';
import 'model.dart';

class MovieBloc extends Bloc<GetMovieListEvent,MovieState>{
  MovieBloc() : super(LoadingMovieList());

  var url = 'https://imdb-api.com/en/API/Top250Movies/k_8pui06c7';
  List<Movie> myList = [];

  void onErrorMovie(){
    add(GetMovieListErrorEvent());
  }

  void successMovie(){
    add(GetMovieListSuccessEvent());
  }

  void onLoading(){
    add(LoadingMovieListEvent());
  }

  Stream<MovieState> mapEventToState(GetMovieListEvent event) async*{
    if(event is LoadingMovieListEvent){
      myList.clear();
      myList = await getMovie();
      if(myList.isNotEmpty){
        successMovie();
      }
      else{
        onErrorMovie();
      }
    }else if(event is GetMovieListSuccessEvent){
      yield(GetMovieList(myList));
    }else{
      yield(ErrorMovie());
    }
  }

  Future<List<Movie>> getMovie() async{
    try{
      var response = await Dio().get(url);
      Map<String,dynamic> js = response.data;
      List<dynamic> myList = js['items'];
      List<Movie> movie = myList.map((e) => Movie.fromJson(e)).toList();
      return movie;
    }
    catch(error){
      return throw UnimplementedError('There are a Error');
    }
  }

}