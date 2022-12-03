abstract class GetMovieListEvent{}

class GetMovieListSuccessEvent extends GetMovieListEvent{}
class LoadingMovieListEvent extends GetMovieListEvent{}
class GetMovieListErrorEvent extends GetMovieListEvent{}