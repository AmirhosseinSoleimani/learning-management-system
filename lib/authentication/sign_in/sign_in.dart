import 'package:flutter/material.dart';
import '../../bloc/blocState.dart';




enum AuthMode{signup,signIn}
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
bool remember = false;

class SignIn extends StatelessWidget {
  final BlocState state;
  SignIn({Key? key,required this.state}) : super(key: key);


  AuthMode _authMode = AuthMode.signIn;
  final Map<String, String> _authData = {
    'email': '',
    'password': ''
  };

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 8.0,
          child: Container(
            height: _authMode == AuthMode.signup ? 320:260,
            constraints: BoxConstraints(maxHeight: _authMode == AuthMode.signup ? 320:260),
            width: MediaQuery.of(context).size.width * 0.3 < 400 ? 400 : MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-Mail'),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if((value ?? '').isEmpty){
                          return 'cannot be empty';
                        }
                          else if(!value!.contains('@')){
                          return 'Invalid email!';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _authData['email'] = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'password'),
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value){
                        if(value!.isEmpty || value.length < 5){
                          return 'Password is too short!';
                        }
                        return null;
                      },
                      onSaved: (value){
                        _authData['password'] = value!;
                      },
                    ),
                    AbsorbPointer(
                      absorbing: state is Loading,
                      child: Column(
                        children: [
                          Row(

                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
