import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/reset-password-page.dart';
import 'package:flutter_app/pages/sing_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: 120,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                    fontSize: 20,
                ),
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Colors.black38,
                    fontWeight:  FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.text,
                style: TextStyle(
                    fontSize: 20,
                ),
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                    )
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(
                      builder: (context) => ResetPasswordPage()
                    ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0xFFF58524),
                      Color(0XFFF92B7F),
                    ],
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  )
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Cadastre-se",
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SingUpPage()
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
