// import 'package:flutter/material.dart';

// // Pages
// import './main/home.dart';
// import './main/company_sign_up.dart';
// // import './startup_name_generator.dart';

// // Screens
// // import '../screens/home.dart';
// // import '../screens/parallax_list.dart';
// // import '../screens/second_screen.dart';

// class HomePage extends StatefulWidget {

//   @override
//   _HomePageState createState() => new _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedDrawerIndex = 0;
//   final NetworkImage userImage = new NetworkImage('https://lh3.googleusercontent.com/-8dg263oazcQ/AAAAAAAAAAI/AAAAAAAAAAA/AB6qoq23B20ArLMIL0kFHyMvk_FBOFKyNA/s120-p-no-mo-il/photo.jpg');
//   final NetworkImage userBackgroundImage = new NetworkImage('https://hdwallpaperim.com/wp-content/uploads/2017/08/25/466074-low_poly-landscape-mountains-mist-dead_trees-forest-river-water-stones-fence-trunks-Axe-hills-digital_art-3D-Cinema_4D-748x421.jpg');
//   bool _userImageLoading = true;
//   bool _userBackgroundImageLoading = true;
  
//   @override
//   void initState() {
//     userImage.resolve(new ImageConfiguration()).addListener((_, __) {
//       if (mounted) {
//         setState(() {
//           _userImageLoading = false;
//         });
//       }
//     });
//     userBackgroundImage.resolve(new ImageConfiguration()).addListener((_, __) {
//       if (mounted) {
//         setState(() {
//           _userBackgroundImageLoading = false;
//         });
//       }
//     });
//   }

//   _getDrawerItemWidget(int pos) {
//     switch (pos) {
//       case 0:
//         return new Home();
//       case 1:
//         return new ParallaxList();
//       case 2:
//         return new SecondScreen();

//       default:
//         return new Text("Error");
//     }
//   }

//   _onSelectItem(int index) {
//     setState(() => _selectedDrawerIndex = index);
//     Navigator.of(context).pop(); // close the drawer
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Row(
//           children: <Widget>[
//             new Text(
//               'Custom Layout App',
//             ),
//             new Padding(
//               padding: EdgeInsets.only(left: 8.0),
//               child: new Icon(
//                 Icons.spa,
//                 color: Colors.lime,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.green[800],
//       ),
//       drawer: new Drawer(
//         child: new ListView(
//           children: <Widget>[
//             new UserAccountsDrawerHeader(
//               accountName: new Text('John Doe'),
//               accountEmail: new Text('johndoe@gmail.com'),
//               currentAccountPicture: new GestureDetector(
//                 onTap: () {} ,
//                 child: new CircleAvatar(
//                   backgroundImage: userImage,
//                 ),
//               ),
//               decoration: new BoxDecoration(
//                 image: new DecorationImage(
//                   fit: BoxFit.fill,
//                   image: userBackgroundImage,
//                 ),
//               ),
//             ),
//             new ListTile(
//               title: new Text("Home Page"),
//               leading: new Icon(Icons.home,),
//               selected: 0 == _selectedDrawerIndex,
//               onTap: () {
//                 _onSelectItem(0);
//                 setState((){
//                   _selectedDrawerIndex = 0;
//                 });
//               }
//             ),
//             new ListTile(
//               title: new Text("First Screen"),
//               leading: new Icon(Icons.star,),
//               selected: 1 == _selectedDrawerIndex,
//               onTap: () {
//                 _onSelectItem(1);
//                 setState((){
//                   _selectedDrawerIndex = 1;
//                 });
//               }
//             ),
//             new ListTile(
//               title: new Text("Second Screen"),
//               leading: new Icon(Icons.ondemand_video,),
//               selected: 2 == _selectedDrawerIndex,
//               onTap: () {
//                 _onSelectItem(2);
//                 setState((){
//                   _selectedDrawerIndex = 2;
//                 });
//               }
//             ),
//             new Divider(),
//             new ListTile(
//               title: new Text("First Page"),
//               leading: new Icon(Icons.person_pin,),
//               onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (BuildContext context) => new OtherPage(pageText: "First Page", color: Colors.red[800]),
//               ),),
//             ),
//             new ListTile(
//               title: new Text("Second Page"),
//               leading: new Icon(Icons.publish,),
//               onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//                 builder: (BuildContext context) => new OtherPage(pageText: "Second Page", color: Colors.blue[800]),
//               ),),
//             ),
//             // new ListTile(
//             //   title: new Text("Random Words"),
//             //   leading: new Icon(Icons.translate,),
//             //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//             //     builder: (BuildContext context) => new StartupNameGenerator(),
//             //   ),),
//             // ),
//             new Divider(),
//             new ListTile(
//               title: new Text("Close"),
//               leading: new Icon(Icons.cancel,),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//           ],
//         ),
//       ),
//       body: _getDrawerItemWidget(_selectedDrawerIndex),
//     );
//   }
// }