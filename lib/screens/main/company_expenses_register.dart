import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gastos_rd/components/group_title.dart';
import 'package:gastos_rd/models/company.dart';
import 'package:gastos_rd/models/company_expenses.dart';
import 'package:image_picker/image_picker.dart';

// import 'package:socialy/data/rest_ds.dart';
import '../../services/validators.dart';
import '../../components/date_picker.dart';

List<Company> _companies = [
  Company(rnc: "1-1111111-1", serviceName: "Service Name 1"), 
  Company(rnc: "2-2222222-2", serviceName: "Service Name 2"), 
  Company(rnc: "3-3333333-3", serviceName: "Service Name 3"), 
  Company(rnc: "4-4444444-4", serviceName: "Service Name 4"), 
  Company(rnc: "5-5555555-5", serviceName: "Service Name 5"), 
];

Company _company = _companies[0];

class CompanyExpensesRegister extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
        primary: false,
        child: CompanyExpensesRegisterForm(),
      ),
    );
  }
}

class CompanyExpensesRegisterForm extends StatefulWidget {
  @override
  _CompanyExpensesRegisterFormState createState() => _CompanyExpensesRegisterFormState();
}

class _CompanyExpensesRegisterFormState extends State<CompanyExpensesRegisterForm> {
  final TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final Validators _validators = new Validators();
  bool _autovalidate = false;
  bool _obscurePassword = true;
  bool _obscureRepeatPassword = true;
  CompanyExpenses _newCompanyExpenses = CompanyExpenses(date: DateTime.now());
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

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
    loading();
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
    print(_newCompanyExpenses);
    // await RestDatasource.signUp(_newCompanyExpenses);
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            GroupTitle(
              icon: Icon(Icons.room_service),
              title: 'Service',
            ),
            InputDecorator(
              decoration: InputDecoration(
                labelText: 'Select a Company',
                fillColor: Colors.grey[150],
                filled: true,
              ),
              isEmpty: _company == null,
              child: DropdownButton<Company>(
                isDense: true,
                hint: Text('Select a Company'),
                value: _company,
                onChanged: (newValue) {
                  setState(() {
                    _company = newValue;
                  });
                },
                items: _companies.map((Company company) {
                  return DropdownMenuItem<Company>(
                    value: company,
                    child: Text(
                      company.serviceName,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            GroupTitle(
              icon: Icon(Icons.person_outline),
              title: 'Supplier Information',
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "RNC Supplier",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: _validators.validateRNC,
              onSaved: (value) => _newCompanyExpenses.rncSupplier = value,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
            ),
            GroupTitle(
              icon: Icon(Icons.receipt),
              title: 'Invoice Information',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "NCF",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: (value) => value.length > 0 ? null : 'NCF is required.',
              onSaved: (value) => _newCompanyExpenses.ncf = value,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            DatePicker(
              decoration: InputDecoration(
                labelText: 'Date',
                fillColor: Colors.grey[150],
                filled: true,
              ),
              firstDate: DateTime(2000, 1, 1),
              selectedDate: _newCompanyExpenses.date,
              selectDate: (DateTime date) {
                setState(() {
                  _newCompanyExpenses.date = date;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Total",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: (value) => _validators.validatePrice(value, "Total"),
              onSaved: (value) => _newCompanyExpenses.total = double.parse(value) ?? 0.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'ITBIS',
                fillColor: Colors.grey[150],
                filled: true,
              ),
              validator: (value) => _validators.validatePrice(value, 'ITBIS'),
              onSaved: (value) => _newCompanyExpenses.itbis = double.parse(value) ?? 0.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Evidence Photo',
                      fillColor: Colors.grey[150],
                      filled: true,
                    ),
                    validator: (value) => value.length > 0 ? null : 'Evidence Photo is required.',
                    onSaved: (value) => _newCompanyExpenses.imageUri = value,
                  ),
                ),
                Flexible(
                  child: CupertinoButton(
                    onPressed: () => getImage,
                    child: Text('Select Photo'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Purchase Concept",
                fillColor: Colors.grey[150],
                filled: true,
              ),
              maxLines: 4,
              onSaved: (value) => _newCompanyExpenses.purchaseConcept = value,
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
                child: Text('REGISTER', style: TextStyle(color: Colors.white, fontSize: 18.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}