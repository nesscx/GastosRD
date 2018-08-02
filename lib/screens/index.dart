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
  _HomePageState createState() => new _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;
  // bool _userImageLoading = true;
  // bool _userBackgroundImageLoading = true;
  User user;
  
  _HomePageState(this.user);

  // @override
  // void initState() {
  //   userImage.resolve(new ImageConfiguration()).addListener((_, __) {
  //     if (mounted) {
  //       setState(() {
  //         _userImageLoading = false;
  //       });
  //     }
  //   });
  //   userBackgroundImage.resolve(new ImageConfiguration()).addListener((_, __) {
  //     if (mounted) {
  //       setState(() {
  //         _userBackgroundImageLoading = false;
  //       });
  //     }
  //   });
  // }

  _getDrawerItemWidget(int pos) {
    if (pos == 1) {
      return new CompanyRegister(user);
    } else if (pos == 2) {
      return new CompanyExpensesRegister(user);
    } else if (pos == 3) {
      return new SearchExpenses(user);
    } else if (pos == 4) {
      return new About(user);
    } else {
      return new About(user);
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Row(
          children: <Widget>[
            new Text(
              'Gastos RD',
            ),
            new Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: new Icon(
                Icons.spa,
                color: Colors.lime,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[800],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(user.name),
              accountEmail: new Text(user.email),
              currentAccountPicture: new GestureDetector(
                onTap: () {} ,
                child: new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(user.name[0].toUpperCase(), style: TextStyle(fontSize: 32.0, color: Colors.white),),
                ),
              ),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/background.jpg'),
                ),
              ),
            ),
            new ListTile(
              title: new Text("Register a Company"),
              leading: new Icon(Icons.business,),
              selected: 1 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(1);
                setState((){
                  _selectedDrawerIndex = 1;
                });
              }
            ),
            new ListTile(
              title: new Text("Register Expenses"),
              leading: new Icon(Icons.receipt,),
              selected: 2 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(2);
                setState((){
                  _selectedDrawerIndex = 2;
                });
              }
            ),
            new ListTile(
              title: new Text("Search expenses"),
              leading: new Icon(Icons.search,),
              selected: 3 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(3);
                setState((){
                  _selectedDrawerIndex = 3;
                });
              }
            ),
            new ListTile(
              title: new Text("About"),
              leading: new Icon(Icons.person,),
              selected: 4 == _selectedDrawerIndex,
              onTap: () {
                _onSelectItem(4);
                setState((){
                  _selectedDrawerIndex = 4;
                });
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              leading: new Icon(Icons.cancel,),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}