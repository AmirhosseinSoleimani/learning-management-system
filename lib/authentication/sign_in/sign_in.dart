import 'package:flutter/material.dart';

enum AuthMode{Signup,Signin}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthMode _authMode = AuthMode.Signin;
  final Map<String, String> _authData = {
    'email': '',
    'password': ''
  };
  var _iaLoading = false;
  final _passwordController = TextEditingController();
  void _submit(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    _formKey.currentState!.save();
    setState((){
      _iaLoading = true;
    });
    if(_authMode == AuthMode.Signin){

    }else{

    }
    setState((){
      _iaLoading = false;
    });
  }

  void _switchAuthMode(){
    if(_authMode == AuthMode.Signin){
      setState((){
        _authMode = AuthMode.Signup;
      });
    }else{
      setState((){
        _authMode = AuthMode.Signin;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
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
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
          ),
          elevation: 8.0,
          child: Container(
            height: _authMode == AuthMode.Signup ? 320:260,
            constraints: BoxConstraints(maxHeight: _authMode == AuthMode.Signup ? 320:260),
            width: deviceSize.width * 0.75,
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-Mail'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty || !value.contains('@')){
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
                      },
                      onSaved: (value){
                        _authData['password'] = value!;
                      },
                    ),
                    if(_authMode == AuthMode.Signup)
                      TextFormField(
                        enabled: _authMode == AuthMode.Signup,
                        decoration: const InputDecoration(labelText: 'Confirm Password',
                        ),
                        obscureText: true,
                        validator: _authMode == AuthMode.Signup ? (value){
                          if(value != _passwordController.text){
                            return 'Password do not match!';
                          }
                        }: null,
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    if(_iaLoading)
                      const CircularProgressIndicator()
                    else
                      ElevatedButton(
                        onPressed: _submit,
                        child: Text(_authMode == AuthMode.Signin ? 'SignIn' : 'SignUp'),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 8.0),
                        ),
                      ),
                    TextButton(
                      onPressed: _switchAuthMode,
                      child: Text(
                          '${_authMode == AuthMode.Signin ? 'SignUp' : 'SignIn'} INSTEAD'
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 4.0
                        ),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )

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
