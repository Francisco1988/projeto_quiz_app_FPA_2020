import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/sign.dart';
import 'package:quiz_app/widgets/widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


    final _formKey = GlobalKey<FormState>();
    String nome, email, senha;
    AuthService authService = new AuthService();
    bool _isLoading = false;

    signUp() async{
      if(_formKey.currentState.validate()){

        setState(() {
          _isLoading =true;
        });

        authService.signUpWithEmailAndPassword(email, senha).then((value){
          if (value != null){
            setState(() {
          _isLoading =false;
        });
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=> Home()
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
      body: _isLoading ? Container (
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column (
            children: [
              Spacer(),

              TextFormField(
                validator: (val){return val.isEmpty ? "Entre com o nome": null;},
                decoration: InputDecoration(
                    hintText: "nome"
                ),
                onChanged: (val){
                  nome=val;
                },
              ),
              SizedBox(height: 2,),

              TextFormField(
                validator: (val){return val.isEmpty ? "Entre com o email correto": null;},
                decoration: InputDecoration(
                    hintText: "email"
                ),
                onChanged: (val){
                  email=val;
                },
              ),
              SizedBox(height: 2,),
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
              SizedBox(height: 2,),
              GestureDetector(
                onTap: (){
                  signUp();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width -10,
                  child: Text ("Sign up", style: TextStyle(color: Colors.white, fontSize: 16),),

                ),
              ),
              SizedBox(height: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("já tem uma conta? ", style: TextStyle(fontSize: 15),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder:(context) => SignIn()
                      ));
                    },
                      child: Text("Sign In", style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),))
                ],
              ),
              SizedBox(height: 2)

            ],),
        ),
      ),
    );
  }
}
