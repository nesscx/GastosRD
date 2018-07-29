import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gastos_rd/components/group_title.dart';

// import 'package:socialy/data/rest_ds.dart';
import '../../models/user.dart';
import '../../services/validators.dart';

class SignUp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        primary: false,
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Validators _validators = new Validators();
  bool _autovalidate = false;
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  Widget _signUpButton;
  User _newUser = User(birthdate: DateTime(1940, 1, 1));
  
  void loading(){
    showDialog(
      context: context,
      builder: (BuildContext context) => new Dialog(
        child: SingleChildScrollView(
          child: new Container(
            height: 600.0,
          )
        ),
      ),
    );
  }

  void _handleSubmitted() {
    final FormState form = _formKey.currentState;
    form.save();
    if (!form.validate()) {
      setState(() {
        _autovalidate = true;
      });
      // showInSnackBar('Please fix the errors in red before submitting.');
    } else {
      form.save();
      _signUp();    
    }
  }

  void _signUp() async {
    // await RestDatasource.signUp(_newUser);
  }

  void _showPassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void _showRepeatPassword() {
    setState(() {
      _obscureRepeatPassword = !_obscureRepeatPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            GroupTitle(
              icon: Icon(Icons.person),
              title: 'Basic Information',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Name",
                fillColor: Colors.grey[150],
                filled: true,
                errorMaxLines: 2,
              ),
              validator: (value) => _validators.validateName(value, "Name"),
              onSaved: (value) => _newUser.firstName = value,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: _validators.validateEmail,
              onSaved: (value) => _newUser.email = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              autocorrect: false,
              controller: _passwordController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: _obscurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  alignment: Alignment.bottomCenter,
                  onPressed: _showPassword,
                ),
                fillColor: Colors.grey[150],
                filled: true,
                labelText: "Password",
              ),
              validator: _validators.validatePassword,
              onSaved: (value) => _newUser.password = value,
              obscureText: _obscurePassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: _obscureRepeatPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  alignment: Alignment.bottomCenter,
                  onPressed: _showRepeatPassword,
                ),
                fillColor: Colors.grey[150],
                filled: true,
                labelText: "Repeat Password",
              ),
              validator: (value) => 
                _validators.validateRepeatedPassword(value, _passwordController.text),
              onSaved: (value) => _newUser.passwordConfirmation = value,
              obscureText: _obscureRepeatPassword,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
            ), 
            Container(
              alignment: Alignment.center,
              child: CupertinoButton(
                onPressed: _handleSubmitted,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                color: Colors.blue[600],
                child: Text('SIGN UP', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0),
            ),
            GestureDetector(
              onTap: () => {},
              child: Center(
                child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children:[
                      TextSpan(text: 'Already have an Account? '),
                      TextSpan(
                        text: 'Sign in!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}