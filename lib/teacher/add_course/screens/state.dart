 import 'package:equatable/equatable.dart';

import 'model.dart';

abstract class MovieState extends Equatable{
  const MovieState();
}

class LoadingMovieList extends MovieState{
  @override
  List<Object> get props => [];
}

class GetMovieList extends MovieState{
  List<Movie> movieList;
  GetMovieList(this.movieList);
  @override
  List<Object> get props => [movieList];
}

 class ErrorMovie extends MovieState{
   @override
   List<Object> get props => [];
 }