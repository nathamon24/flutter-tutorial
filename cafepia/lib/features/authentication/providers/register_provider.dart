import 'package:cafepia/navigate_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUpWithEmailAndPassword(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Example: You can update user profile or perform other actions after successful sign-up
        print('User signed up: ${userCredential.user!.email}');

        // Clear fields after successful registration
        clearFields();

        // Navigate to another screen after successful registration (example)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NavigateMenu(),
          ),
        );
      }
    } catch (e) {
      // Handle sign-up errors here
      print('Failed to sign up: $e');

      // Optionally, show an error dialog or message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign up: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  // Method to clear form fields after successful registration
  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
