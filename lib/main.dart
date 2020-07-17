import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(new LoginAlertDemoApp());
}

class LoginAlertDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar:AppBar(
            title:Text('Login Page'),
          ),
          body:
          new LoginHomePage(),
        ));
  }
}

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() {

    return new _LoginHomePageState();
  }
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 70.0,
              alignment:Alignment.centerLeft,
              padding: EdgeInsets.only(left:30.0),
              color: Colors.white,
              child: Icon(Icons.access_alarm,
              color: Colors.white),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left:30.0,right: 30.0),
              child: new Container(
                child: buildForm(),
              ),
            ),

          ],
        ),

      ],
    );
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();


  Widget buildForm() {
    return Form(

      key: formKey,

      autovalidate: true,
      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              keyboardType: TextInputType.number,

              textInputAction: TextInputAction.next,
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: "Username",
                  hintText: "Username",
                  icon: Icon(Icons.person)),

              validator: (v) {
                return v.trim().length > 0 ? null : "Username cannot be empty";
              }),
          TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Your login password", icon: Icon(Icons.lock)),
              obscureText: true,

              validator: (v) {
                return v.trim().length > 5 ? null : "Password need to have at least six digits";
              }),

          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(

                  child: RaisedButton(

                    padding: EdgeInsets.all(15.0),
                    child: Text("Log in"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {

                      if ((formKey.currentState as FormState).validate()) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){return LoginSuccessfulPage();}
                      ));
                      }
                    },
                    onLongPress: (){

                    },
          ),
                ),
                   Expanded(
                   child: RaisedButton(
                    padding:EdgeInsets.all(15.0),
                    child: Text("Sign up"),
                    color: Colors.green,
                    textColor: Colors.white,
                     onPressed:(){

                     }
                  )
                   ),



              ],
            ),
          )
        ],
      ),
    );
  }

}
class LoginSuccessfulPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Successful!"),),
      body: Center(
        child: RaisedButton(
          child: Text("Back"),
          onPressed: (){
            //Navigator.pop(context),，
            Navigator.pop(context);
          },
        ),
      ),

    );
  }
}
