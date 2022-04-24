import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePassword = true;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Form"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name *",
                hintText: 'What can we reach you?',
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                // border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number *",
                hintText: 'What can we reach you?',
                helperText: "Phone format: (xxx)xxx-xxxx",
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email Address",
                hintText: "Enater a email address",
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: "Life Story",
                hintText: "Tell us about your self",
                helperText: "Keep it short, this is just a demo",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _passController,
              obscureText: _hidePassword,
              maxLength: 8,
              decoration: InputDecoration(
                  labelText: "Password *",
                  hintText: "Enter the password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    icon: Icon(_hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  icon: Icon(Icons.security)),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _confPassController,
              obscureText: _hidePassword,
              maxLength: 8,
              decoration: InputDecoration(
                  labelText: "Confirm Password *",
                  hintText: "Enter the password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    icon: Icon(_hidePassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                  icon: Icon(Icons.border_color)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(
                "Submit Form",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    print('Name - ${_nameController.text}');
    print('Phone - ${_phoneController.text}');
    print('Email - ${_emailController.text}');
    print('Story - ${_storyController.text}');
    print('Pass - ${_passController.text}');
    print('Pass conf - ${_confPassController.text} ');
  }
}
