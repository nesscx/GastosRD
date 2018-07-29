import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gastos_rd/components/group_title.dart';
import 'package:gastos_rd/models/company.dart';

// import 'package:socialy/data/rest_ds.dart';
import '../../services/validators.dart';

class CompanySignUp extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        primary: false,
        child: CompanySignUpForm(),
      ),
    );
  }
}

class CompanySignUpForm extends StatefulWidget {
  @override
  _CompanySignUpFormState createState() => _CompanySignUpFormState();
}

class _CompanySignUpFormState extends State<CompanySignUpForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Validators _validators = new Validators();
  bool _autovalidate = false;
  Company _newCompany = Company();
  
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
    // loading();
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
    print(_newCompany);
    // await RestDatasource.signUp(_newUser);
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
              icon: Icon(Icons.business),
              title: 'Company Information',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "RNC",
                fillColor: Colors.grey[150],
                filled: true,
                errorMaxLines: 2,
                hintText: 'E.g: 1-2345678-9 or 123456789'
              ),
              keyboardType: TextInputType.number,
              validator: (value) => _validators.validateRNC(value),
              onSaved: (value) => _newCompany.rnc = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Service Name",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: (value) => _validators.validateName(value, "Service Name"),
              onSaved: (value) => _newCompany.serviceName = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ), 
            Container(
              alignment: Alignment.center,
              child: CupertinoButton(
                onPressed: _handleSubmitted,
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
                color: Colors.blue[600],
                child: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}