import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:gastos_rd/data/rest_ds.dart';
import 'package:gastos_rd/models/user.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final signInFormKey = GlobalKey<FormState>();
  String _password;
  String _email;
  bool _obscurePassword = true;
  
  _signIn() async {
    final signInForm = signInFormKey.currentState;
    if (signInForm.validate()) {
      signInForm.save();
      User user = new User(); // = await RestDatasource.signIn(_username, _password);
      
      print(user);
    } else {
      print('Sign in fields are invalid');
    }
  }
  
  void _showPassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.white,
          accentColor: Colors.blue[600],
        ),
        child: Container(
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            colors: <Color>[
              Colors.lightBlue[400],
              Colors.deepPurple[400],
            ],
          ),
        ),
        padding: EdgeInsets.all(50.0),
        child: Form(
          key: signInFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintStyle: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                  ),
                  labelStyle: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                validator: (value) => value.isEmpty ? 'Username or email is required' : null,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintStyle: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                  ),
                  labelStyle: Theme.of(context).textTheme.caption.copyWith(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                  suffixIcon: IconButton(
                    icon: _obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    alignment: Alignment.bottomCenter,
                    onPressed: _showPassword,
                  ),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                obscureText: _obscurePassword,
                validator: (value) => value.isEmpty ? 'Password is required' : null,
                onSaved: (value) => _password = value,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  child: CupertinoButton(
                    onPressed: _signIn,
                    padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                    color: Colors.white,
                    child: Text('SIGN IN', style: TextStyle(color: Colors.blue[600], fontSize: 18.0),),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.right,
                      text: TextSpan(
                        style: TextStyle(color: Colors.white),
                        children:[
                          TextSpan(text: "Don't have an Account? "),
                          TextSpan(
                            text: 'Sign up!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: GestureDetector(
                  onTap: () => {},
                  child: Center(
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),),
        ),
      ),
    );
  }
}