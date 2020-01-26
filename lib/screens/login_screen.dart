import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:projeto_diana_final/bd/pet_bd.dart';
import 'package:projeto_diana_final/screens/home.dart';

import 'cadastrar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _email, _password;
  final FirebaseAuth auth = FirebaseAuth.instance;

 // our default setting is to login, and we should switch to creating an account when the user chooses to
  //PetBD bd = PetBD();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text(""),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {

    String _email, _password;

    return new Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            new Container(
              child: TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Email'
                ),
                controller: _emailController,
                onSaved: (input){_email = input;},
                validator: (input){
                  if(input.isEmpty){
                    return 'Por favor, entre com o email';
                  }
                },
              ),
            ),
            new Container(
              child: new TextFormField(
                decoration: new InputDecoration(
                    labelText: 'Senha'
                ),
                controller: _passwordController,
                onSaved: (input)=> _password = input,
                obscureText: true,
                validator: (input){
                  if(input.isEmpty){
                    return "Por favor, entre com a senha";
                  }
                },
              ),
            ),
            Divider(),
            RaisedButton(
              child: Text("Entrar"),
                onPressed: () {
                  signIn(_emailController.text, _passwordController.text)
                      .then((FirebaseUser user) {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Home()));
                  }).catchError((e) => print(e));
                }
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.all(5),
                child: Text("Criar conta"),
            ),

            Padding(
              padding: EdgeInsets.all(5),
              child: Text("Esqueceu a senha"),
            ),
          ],
        ),
      )
    );
  }



  void _loginPressed () {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Home()),
    );
  }

  Future<FirebaseUser> signIn(String email, String password) async {
    auth.createUserWithEmailAndPassword(email: "testeee@email.com", password: "l23456");
    GoogleAuthProvider google = GoogleAuthProvider();
    print(google);
    GoogleSignIn googlee = GoogleSignIn();
    print("dsadas");
    AuthResult result = await auth.signInAnonymously();
    print(result);
    print("dsadsa");
    //AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
    final FirebaseUser user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await auth.currentUser();
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;

  }



}