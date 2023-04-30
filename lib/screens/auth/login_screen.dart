import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

bool _passwordVisible = false;

@override
void initState() {
  _passwordVisible = false;
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        centerTitle: true,
        title: Title(
          color: Colors.white,
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/plane-bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 0, 97, 161),
                    Color.fromARGB(255, 0, 109, 176),
                    Color.fromARGB(255, 0, 145, 228),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    const Image(
                      image: AssetImage('assets/images/logo/logow.png'),
                      height: 100,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Student Mail",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.mail),
                        prefixIconColor: Colors.white,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: !_passwordVisible,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.key),
                        prefixIconColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          textStyle: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                          foregroundColor:
                              const Color.fromARGB(255, 101, 101, 101),
                          backgroundColor:
                              const Color.fromARGB(255, 239, 239, 239),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              //topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
