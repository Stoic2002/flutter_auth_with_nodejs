import 'package:flutter/material.dart';
import 'package:flutter_auth_with_nodejs/screens/home_screen.dart';
import 'package:flutter_auth_with_nodejs/screens/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => HomeScreen()),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                CustomTextField(
                  hintText: 'Email',
                  controller: _emailController,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: _passwordController,
                ),
                SizedBox(height: 40),
                CustomButton(
                  text: 'Login',
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(
                      LoginEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => RegisterScreen()),
                    );
                  },
                  child: Text('Don\'t have an account? Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
