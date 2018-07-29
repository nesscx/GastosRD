// import 'package:socialy/json/user_response.dart';

class User {
  final String id;
  String firstName;
  String lastName;
  String username;
  String email;
  bool emailConfirmation;
  String password;
  String passwordConfirmation;
  DateTime birthdate;
  DateTime createdDate;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.emailConfirmation,
    this.password,
    this.passwordConfirmation,
    this.birthdate,
    this.createdDate,
  });

  // User.fromResponse(UserResponse response)
  //     : id = response.id,
  //       firstName = response.firstName,
  //       lastName = response.lastName,
  //       username = response.username,
  //       email = response.email,
  //       emailConfirmation = response.emailConfirmation,
  //       password = response.password,
  //       passwordConfirmation = response.passwordConfirmation,
  //       birthdate = response.birthdate,
  //       createdDate = response.createdDate;
}