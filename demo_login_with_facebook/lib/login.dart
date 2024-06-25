import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'profile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Future<void> login(BuildContext context) async {
    try {
      // Trigger Facebook login
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email'],
      );
      // Check login result
      if (result.status == LoginStatus.success) {
        // Successfully logged in with Facebook, now authenticate with Firebase
        final AccessToken accessToken = result.accessToken!;
        // Create a Facebook credential
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);
        // Sign in with Firebase using the Facebook credential
        final UserCredential firebaseUserCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        // Navigate to profile screen or do other actions after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ProfileScreen(accessToken: accessToken),
          ),
        );
      } else if (result.status == LoginStatus.cancelled) {
        print('Facebook login canceled');
      } else {
        print('Facebook login failed: ${result.message}');
      }
    } catch (e) {
      print('Error during Facebook login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await login(context);
          },
          child: const Text('Login with Facebook'),
        ),
      ),
    );
  }
}
