// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/services/auth_services.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// class AuthenticationPage extends StatelessWidget {
//   const AuthenticationPage({Key key}) : super(key: key);
class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  // final _auth = AuthServices();
  bool isVisible = false;
  bool isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 400),
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icons/logo2.png",
                  fit: BoxFit.fitWidth,
                ),
                Expanded(child: Container()),
                Row(
                  children: [
                    Text("Login", style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Welcome back to the admin panel.",
                      color: lightGrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) => _emailController.text.isEmpty ? "Please enter your email !!" : null,
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) => _passwordController.text.isEmpty ? "Please enter your password !!" : null,
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "123",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        CustomText(
                          text: "Remeber Me",
                        ),
                      ],
                    ),
                    CustomText(text: "Forgot password?", color: active)
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () async {
                     Get.offAllNamed(rootRoute);
                    // if (_formKey.currentState.validate()) {
                    //   setState(() {
                    //     isLoading = true;
                    //   });
                    //   try {
                    //     final user = await _auth.validateAdmin(
                    //         _emailController.text.trim().toLowerCase(), _passwordController.text.trim());

                    //     if (user != null) {
                    //       // SharedPreferences prefs =
                    //       //     await SharedPreferences.getInstance();
                    //       // prefs.setString('userId', user.userId);
                    //       Get.offAllNamed(rootRoute);
                    //     } else if (user == null) {
                    //       UserCredential admin = await _auth.signInWithEmailAndPassword(
                    //           _emailController.text.trim(), _passwordController.text.trim());
                    //       final superAdmin = await _auth.fetchAdmin(admin.user.uid);
                    //       Get.offAllNamed(rootRoute);
                    //     }
                    //   } catch (e) {} finally {
                    //     setState(() {
                    //       isLoading = false;
                    //     });
                    //   }
                    // }
                  },
                  child: Container(
                    decoration: BoxDecoration(color: active, borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CustomText(
                      text: "Login",
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: "Do not have admin credentials? "),
                  TextSpan(text: "Request Credentials! ", style: TextStyle(color: active))
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
