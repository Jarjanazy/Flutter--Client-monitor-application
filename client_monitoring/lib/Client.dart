import 'package:json_annotation/json_annotation.dart';

part "Client.g.dart";

@JsonSerializable()
class Client {
  Client (this.id, this.firstName, this.lastName);

  int id;
  String firstName;
  String lastName;


}