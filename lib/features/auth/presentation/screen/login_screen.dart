
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopsphere/core/router/route_names.dart';
import 'package:shopsphere/core/utils/MyFlutterUtils.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child:           Column(
              /*mainAxisAlignment: MainAxisAlignment.center,*/
              children: [
                Column(
                  children: [
                    SizedBox(height: 40,),
                    Image(image: AssetImage('assets/images/shopsphere_logo.png'), height: 100, width: 100,),
                    Text('ShopSphere', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15,),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              MyFlutterUtils.showSnackBar(context, 'Forgot Password?');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            )
                        ),
                      ),
                      SizedBox(height: 2,),
                      ElevatedButton(
                        onPressed: () {
                          context.go(RouteNames.home);
                        },
                        child: Text('Login'),
                      ),
                      SizedBox(height: 10,),
                      TextButton(
                        onPressed: (){
                          context.push(RouteNames.signup);
                        },
                        child: Text("Don't have Account? Signup",
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
        ),
      )
    );
  }

}