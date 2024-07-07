import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            Navigator.of(context).pop(); // Go back to login screen
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
                  'Create Account',
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
                  text: 'Register',
                  onPressed: () {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.length < 8) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Invalid email or password (min 8 characters)')),
                      );
                      return;
                    }
                    context.read<AuthBloc>().add(
                          RegisterEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
