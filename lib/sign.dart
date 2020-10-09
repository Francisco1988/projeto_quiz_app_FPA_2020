import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/signup.dart';
import 'package:quiz_app/widgets/widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  String email, senha;
  AuthService authService = new AuthService();

  bool _isLoading = false;

  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, senha).then((val){
        if (val!= null){
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }
      });
    }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
       backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ): Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column (
            children: [
              Spacer(),
              TextFormField(
                validator: (val){return val.isEmpty ? "Entre com o email correto": null;},
                decoration: InputDecoration(
                  hintText: "email"
                ),
                onChanged: (val){
                  email=val;
                },
              ),
              SizedBox(height: 16,),
              TextFormField(
                obscureText: true,
                validator: (val){return val.isEmpty ? "Entre com a senha correta": null;},
                decoration: InputDecoration(
                    hintText: "senha"
                ),
                onChanged: (val){
                  senha=val;
                },
              ),
              SizedBox(height: 20,),

              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width -48,
                  child: Text ("Sign in", style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("crie sua conta  ", style: TextStyle(fontSize: 15),),
                  GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder:(context) => SignUp()
                        ));
                      },
                      child: Text("Sign Up", style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),))
                ],
              ),
              SizedBox(height: 13)

          ],),
        ),
      ),
    );
  }
}
