import 'dart:io';
import 'package:equatable/equatable.dart';

class SignupModel extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int gender;
  final String hobbies;
  final File? image;
  final String password;

  const SignupModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.hobbies,
    required this.image,
    required this.password,
  });

  @override
  List<Object?> get props => [firstName,lastName,email,mobile,gender,hobbies,image,password];
}
