import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/login.png'), fit: BoxFit.cover
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left:40, top: 120),
              child: Text('Welcome to QuickChat', style: TextStyle(
                color: Colors.white, fontSize: 33
              ),),
            ),
            SingleChildScrollView(
              child:  Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5, right: 35, left: 35),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter username',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                    SizedBox(
                      height: 400,
                    ),
                    Row(
                      children: [
                        Text('Sign In', style: TextStyle(
                          color: Colors.black,
                        fontSize: 27, fontWeight: FontWeight.w700
                      ),
                      ),
                        CircleAvatar(
                          radius: 30,
                          // backgroundColor: Color(0xff4c50fb),
                          child: IconButton(
                            color: Colors.white,
                            onPressed: (){},
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
