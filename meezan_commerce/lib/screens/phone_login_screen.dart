import 'package:flutter/material.dart';
import 'package:meezan_commerce/services/auth_service.dart';

class PhoneLoginScreen extends StatefulWidget {
  const PhoneLoginScreen({super.key});

  @override
  State<PhoneLoginScreen> createState() => _PhoneLoginScreenState();
}

class _PhoneLoginScreenState extends State<PhoneLoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _verificationCodeController =
      TextEditingController();
  final auth_service = AuthService();
  bool _isCodeSent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
                child: Column(
              children: <Widget>[
                !_isCodeSent
                    ? TextFormField(
                        controller: _phoneNumberController,
                        decoration: InputDecoration(labelText: 'Phone Number'),
                      )
                    : TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Verification Code'),
                        controller: _verificationCodeController,
                      ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFF6200EE),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // Implement phone login here
                      auth_service
                          .signInwithPhoneNumber(_phoneNumberController.text, _verificationCodeController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                _isCodeSent ? value.toString() :'Verification code sent to ${_phoneNumberController.text}')));
                        setState(() {
                          _isCodeSent = true;
                        });
                      });
                    },
                    child: Text('Verify'),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
