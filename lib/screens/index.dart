import 'package:flutter/material.dart';
import 'package:gastos_rd/models/user.dart';

// Pages
import './main/company_register.dart';
import './main/company_expenses_register.dart';
import './main/search_expenses.dart';
import './main/about.dart';

// Screens

class HomePage extends StatefulWidget {
  final User user;

  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  // bool _userImageLoading = true;
  // bool _userBackgroundImageLoading = true;
  User user;
  
  _HomePageState(this.user);

  // @override
  // void initState() {
  //   userImage.resolve(ImageConfiguration()).addListener((_, __) {
  //     if (mounted) {
  //       setState(() {
  //         _userImageLoading = false;
  //       });
  //     }
  //   });
  //   userBackgroundImage.resolve(ImageConfiguration()).addListener((_, __) {
  //     if (mounted) {
  //       setState(() {
  //         _userBackgroundImageLoading = false;
  //       });
  //     }
  //   });
  // }

  _getDrawerItemWidget(int pos) {
    if (pos == 1) {
      return CompanyRegister(user);
    } else if (pos == 2) {
      return CompanyExpensesRegister(user);
    } else if (pos == 3) {
      return SearchExpenses(user);
    } else if (pos == 4) {
      return About(user);
    } else {
      return About(user);
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              'Gastos RD',
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.spa,
                color: Colors.lime,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[800],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: GestureDetector(
                onTap: () {} ,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(user.name[0].toUpperCase(), style: TextStyle(fontSize: 32.0, color: Colors.white),),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/background.jpg'),
                ),
              ),
            ),
             ListTile(
              title:  Text("Register a Company"),
              leading: Icon(Icons.business,),
              selected: 1 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(1);
                setState((){
                  _selectedDrawerIndex = 1;
                });
              }
            ),
            ListTile(
              title: Text("Register Expenses"),
              leading: Icon(Icons.receipt,),
              selected: 2 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(2);
                setState((){
                  _selectedDrawerIndex = 2;
                });
              }
            ),
            ListTile(
              title: Text("Search expenses"),
              leading: Icon(Icons.search,),
              selected: 3 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(3);
                setState((){
                  _selectedDrawerIndex = 3;
                });
              }
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.person,),
              selected: 4 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(4);
                setState((){
                  _selectedDrawerIndex = 4;
                });
              }
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              leading: Icon(Icons.cancel,),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}