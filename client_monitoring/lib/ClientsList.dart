import 'dart:developer' as prefix0;

import 'package:client_monitoring/dbClient.dart';
import 'package:flutter/foundation.dart';

import 'Client.dart';

class ClientsList extends ChangeNotifier{

  /* it interacts with the dbClient to performe CRUD opertaions on the SQLite database,
     the dbClient is a singleton
  */
  DBClient dbClient = DBClient.myDB;

  addNewClient(Client newClient){
    Future<int> clientId = dbClient.newClient(newClient);

    clientId.then((onValue){
      prefix0.log(onValue.toString() + " was added succesfully");
    }).catchError((){
      prefix0.log("An error occurd while inserting " + newClient.id.toString());
    });

    notifyListeners();
  }

  getAllClients() async{
    return await dbClient.getAllClients();
  }



}