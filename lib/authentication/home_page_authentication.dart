import 'package:flutter/material.dart';
import 'package:learning_management_system/authentication/sign_in/sign_in.dart';
import 'package:learning_management_system/authentication/sign_up/sign_up.dart';
import '../student/screens/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/blocState.dart';
import '../bloc/userBloc.dart';

class HomePageAuthentication extends StatelessWidget {
  static const routeName = '/authentication';
  const HomePageAuthentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18.0,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/cover.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BlocBuilder<UserBloc,BlocState>
                            (builder: (context,state){
                              if(state is Authenticated){
                                return const Dashboard();
                              }
                              return SignIn(state: state);
                          }
                          )
                        ),
                      );
                    },
                    child: Text('Sign in')),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  SignUp()));
                    }, child: Text('Sign up')),
              )
            ],
          )
        ],
      ),
    );
  }
}
