import 'package:flutter/material.dart';

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  bool isStudent = true;

  void toggleLoginOption() {
    setState(() {
      isStudent = !isStudent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BUS TRACKER',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isStudent ? 'STUDENT LOGIN' : 'DRIVER LOGIN',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none),
                    fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    filled: true,
                    prefixIcon: Icon(Icons.person)),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  }
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Zo-9.!#$%&'*+-/=?^_`{|}~]@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value);
                  if (!emailValid) {
                    return "Enter Valid Email";
                  }
                }),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: Icon(Icons.person),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 67),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: toggleLoginOption,
              child: Text(
                isStudent ? 'Log in as Driver' : 'Log in as Student',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
