import 'package:cafepia/features/authentication/screens/login/login.dart';
import 'package:cafepia/navigate_menu.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Profile {
  final String uid; // Firebase user ID
  final String name; // User's name
  final String email; // User's email address
  final String? photoUrl; // URL to user's profile photo (nullable)

  Profile({
    required this.uid,
    required this.name,
    required this.email,
    this.photoUrl,
  });
}

class ProfileProvider with ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  void updateUser(Profile profile) {
    _profile = profile;
    notifyListeners();
  }

  void clearProfile() {
    _profile = null;
    notifyListeners();
  }


  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String? name = userCredential.user!.displayName;
      String? photoUrl = userCredential.user!.photoURL;

      final profile = Profile(
        uid: userCredential.user!.uid,
        name: name ?? '',
        email: userCredential.user!.email ?? '',
        photoUrl: photoUrl,
      );
      updateUser(profile);

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NavigateMenu()),
      );
    } catch (e) {
      print('Failed to sign in: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign in: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      clearProfile();

      // Navigate to the login screen and clear all previous routes
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    } catch (e) {
      print('Failed to sign out: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign out: $e'),
          duration: Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken.tokenString);

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          final userData = await FacebookAuth.instance
              .getUserData(fields: "email,name,picture.width(500)");
          final profilePictureUrl = userData['picture']['data']['url'];
          final profile = Profile(
            uid: user.uid,
            name: userData['name'],
            email: userData['email'],
            photoUrl: profilePictureUrl,
          );
          updateUser(profile);
        } else {
          print('Failed to sign in with Facebook: User is null');
        }
      } else {
        print('Facebook login failed: ${result.status}');
      }
    } catch (e) {
      print('Failed to sign in with Facebook: $e');
    }
  }
}
