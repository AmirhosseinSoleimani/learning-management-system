import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms/module/widgets.dart';
import 'package:lms/sign_up/sign_up.dart';
import 'package:lms/teacher/bloc/blocState.dart';
import 'module/extension.dart';

TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
bool remember = false;

class Login extends StatelessWidget {
  final BlocState state;
  const Login({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
              size: 18.0,
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
          )
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: context.width * 0.3 < 400 ? 400 : context.width * 0.3,
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(
                flex: 3,
                child: Image(
                  image: AssetImage('assets/images/login.png'),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    MEdit(
                      hint: 'userName',
                      notEmpty: true,
                      controller: _mobile,
                    ).margin9,
                    MEdit(
                      hint: 'password',
                      notEmpty: true,
                      password: true,
                      controller: _pass,
                    ).margin9,
                    AbsorbPointer(
                      absorbing: state is Loading,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              MCheckBox(
                                hint: 'Remember me',
                                value: remember,
                                onChange: (value) {
                                  remember = value;
                                },
                              ),
                              'Remember me!'.toLabel(),
                              const Spacer(),
                              MTextButton(
                                onPressed: () {
                                },
                                title: 'Register',
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MButton(
                                title: 'Login',
                                onTap: () => {
                                  if (_formkey.currentState!.validate())
                                    context.userBloc.authenticate(
                                        _mobile.text, _pass.text, remember)
                                },
                                padding: const EdgeInsets.all(22.0),
                                icon: const Icon(Icons.vpn_key),
                                color: Colors.blue,
                              ).margin9,
                              state is Loading ? const MWaiting() : Container(),
                              const Spacer(),
                              MTextButton(
                                title: 'Forgot my password',
                                onPressed: () {},
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    state is Failed
                        ? MError(exception: (state as Failed).exception)
                        : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ).padding9.card.center,
    );
  }
}
