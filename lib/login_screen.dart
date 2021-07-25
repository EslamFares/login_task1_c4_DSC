import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "Email",
                    icon: Icon(Icons.account_circle),
                    enabledBorder: border(Colors.amber),
                    errorBorder: border(Colors.red),
                    focusedBorder: border(Colors.blue),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Email required');
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 55,
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: "password",
                    icon: Icon(Icons.lock),
                    enabledBorder: border(Colors.amber),
                    errorBorder: border(Colors.red),
                    focusedBorder: border(Colors.blue),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('password required');
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20),
              // ignore: deprecated_member_use
              RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('login'),
                            content: Text(' Are you sure you want to sing in?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('cancel')),
                              TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('successful  login'),
                                    ));
                                    Navigator.pop(context);
                                  },
                                  child: Text('login'))
                            ],
                          );
                        },
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color, width: 2),
        borderRadius: BorderRadius.circular(10.0));
  }
}
