import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class ProfileScreen extends StatefulWidget {
  final AccessToken accessToken;

  const ProfileScreen({Key? key, required this.accessToken}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
                  SizedBox(height: 20),
                  Text(
                    'Name: ${userData!['name']}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: ${userData!['email']}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
