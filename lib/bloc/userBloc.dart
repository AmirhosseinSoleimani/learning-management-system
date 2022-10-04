import 'package:flutter_bloc/flutter_bloc.dart';
import './blocState.dart';
import './repository/user_repository.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserBloc extends Cubit<BlocState>{
  UserBloc():super(Initial()) {
    SharedPreferences.getInstance().then((value) {
      String token = value.getString("token") ?? '';
      if (token.isNotEmpty) {
        verifyByToken(token);
      }
    });
  }

  User? _user;

  void authenticate(String mobile,String pass,bool remember) async {
    if (state is Loading) return;
    try{
      emit (Loading());
      _user = await UserRepository.authenticate(mobile,pass);
      if(remember){
        await SharedPreferences.getInstance().then((value) => value.setString("token", _user!.token!));
      }
      emit(Authenticated(_user!));
    }
    catch(e){
      emit(Failed(e as Exception));
    }
  }

  void verifyByToken(String token) async {
    if (state is Loading) return;
    try{
      emit (Loading());
      _user = await UserRepository.verifyByToken(token);
      emit(Authenticated(_user!));
    }
    catch(e){
      emit(Initial());
    }
  }

  void signOut() async {
    await SharedPreferences.getInstance().then((value) => value.remove("token"));
    emit(Initial());
  }

  User? get user => _user;
}