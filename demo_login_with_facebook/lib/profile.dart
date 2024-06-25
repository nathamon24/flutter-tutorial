import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ProfileScreen extends StatefulWidget {
  final AccessToken accessToken;

  const ProfileScreen({Key? key, required this.accessToken}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      final userData = await FacebookAuth.instance.getUserData(
        fields: "email,name,picture",
      );

      setState(() {
        this.userData = userData;
      });
    } catch (e) {
      print('Failed to fetch user data: $e');
      // Handle error, e.g., show a dialog or retry option
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: userData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      userData!['picture']['data']['url'],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Name: ${userData!['name']}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Email: ${userData!['email']}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
