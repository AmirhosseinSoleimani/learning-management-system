import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';
import '../../extension/extension.dart';
TextEditingController _mobile = TextEditingController();
TextEditingController _pass = TextEditingController();
bool remember = false;

class SignIn extends StatelessWidget {
  const SignIn({Key? key,}) : super(key: key);

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
