import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/CRUD.dart';


class Log_in extends StatefulWidget {
  const Log_in({super.key});

  @override
  State<Log_in> createState() => _Log_inState();
}

class _Log_inState extends State<Log_in> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            
            child: Text("Login in your Account",style: TextStyle(fontSize: 30),),
          ),
             
            Divider(height: 100),

          Column(
            children: [
              Text("email", textAlign: TextAlign.start,),

 TextField(
            controller: email,
          ),
          Text("password"),
          TextField(
            controller: password,
          ),

            ],
          ),

         
         TextButton(
              onPressed: () async {
                try {
                  var authobject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authobject.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                } catch (e) {
                  print(e.toString());
                }
              },
              child: Text("Create Account")),


              ElevatedButton(onPressed: () async {
                try {
                  var authobject = FirebaseAuth.instance;
                  UserCredential myUser =
                      await authobject.createUserWithEmailAndPassword(
                          email: email.text, password: password.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                   return CRUD();
                            
                        }));

                } catch (e) {
                  print(e.toString());
                }
              }, child: Text("log in"),),
        ],
      ),
    );
  }
}
