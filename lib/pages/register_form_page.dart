import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
// import 'package:android_lab7/pages/user_info_page.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePassword = true;

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();

  List<String> _countries = ['Kazakstan', 'Russian', 'Germany', 'France'];
  late String _selectedCountry = "";

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Form"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              focusNode: _nameFocus,
              autofocus: true,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name *",
                hintText: 'What can we reach you?',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                    onTap: () {
                      _nameController.clear();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.black, width: 2.0)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0)),
                // border: OutlineInputBorder(),
              ),
              validator: (value) =>
              value == null || value.isEmpty ? "Name is required" : null,
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone Number *",
                hintText: 'What can we reach you?',
                helperText: "Phone format: (xxx)xxx-xxxx",
                prefixIcon: Icon(Icons.call),
                suffixIcon: GestureDetector(
                    onTap: () {
                      _phoneController.clear();
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
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
            SizedBox(height: 10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.map),
                  labelText: "Country?"),

              items: _countries.map((country) {
                return DropdownMenuItem(
                  child: Text(country),
                  value: country,
                );
              }).toList(),
              onChanged: (data) {
                print(data);
                setState(() {
                  _selectedCountry = data.toString();
                });
              },
              value: _selectedCountry.isEmpty ? null : _selectedCountry,
              // validator: (val){
              //   return val== null?'Please select a country': null;
              // },
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
              inputFormatters: [
                LengthLimitingTextInputFormatter(100),
              ],
            ),
            SizedBox(height: 10),
            TextFormField(
              focusNode: _passFocus,
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

  MaterialApp? _submitForm() {
    if (_formKey.currentState!.validate()) {
      print("Form is valid");
      print('Name - ${_nameController.text}');
      print('Phone - ${_phoneController.text}');
      print('Email - ${_emailController.text}');
      print('Country - $_selectedCountry');
      print('Story - ${_storyController.text}');
      print('Pass - ${_passController.text}');
      print('Pass conf - ${_confPassController.text} ');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondScreen()));
    }
  }

  SecondScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("User info"),
      ),
      body: ListView(
        children: <Widget>[
          if(_nameController.text.isNotEmpty)
            ListTile(
              leading: Icon(Icons.person),
              title: Text(_nameController.text),
            ),
          if(_phoneController.text.isNotEmpty)
            ListTile(
              leading: Icon(Icons.call),
              title: Text(_phoneController.text),
            ),
          if(_emailController.text.isNotEmpty)
            ListTile(
              leading: Icon(Icons.email),
              title: Text(_emailController.text),
            ),
          if(_selectedCountry.isNotEmpty)
            ListTile(
              leading: Icon(Icons.map),
              title: Text(_selectedCountry),
            ),
          if(_storyController.text.isNotEmpty)
            ListTile(
              leading: Icon(Icons.history),
              title: Text(_storyController.text),
            ),

        ],
      ),
    );
  }

//   String? _validateName(String value) {
//     final _nameExp = RegExp(r'^[A-Za-z ]+$');
//     if (value.isEmpty || value == null) {
//       return "Name is required.";
//     }
//     else if (!_nameExp.hasMatch(value)){
//       return "Please enter alphabetical characters.";
//     }
//     else
//       return null;
//   }
}
