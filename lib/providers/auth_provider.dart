import 'package:flutter/material.dart';
import 'package:auth0_flutter/auth0_flutter.dart';

class AuthProvider with ChangeNotifier {
  final _accessToken = '';
  String get accessToken => _accessToken;
  Credentials? _credentials;
  UserProfile? _userProfile;
  late Auth0 _auth0;

  AuthProvider() {
    _auth0 = Auth0('dev-bjsfdgo1anu5dgdg.us.auth0.com',
        'y78cK6ldBd56LQGFz8nUtliJfC8NgCM9');
  }

  Credentials? get credentials => _credentials;
  UserProfile? get userProfile => _userProfile;

  Future<bool> signIn(
      String email, String password, BuildContext context) async {
    // Mocking email and password validation
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both email and password')),
      );
      return false;
    }

    try {
      _credentials = await _auth0.webAuthentication(scheme: 'myapp').login();

      if (_credentials != null) {
        _userProfile = await _fetchUserProfile(_credentials!.accessToken);
      }

      notifyListeners();
      return true;
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Authentication failed: $e')),
      );
      return false;
    }
  }

  Future<UserProfile> _fetchUserProfile(String accessToken) async {
    // Use the accessToken to fetch user profile from Auth0 Management API
    // UserProfile userProfile = await _auth0.getUser(accessToken);
    // return userProfile;
    throw UnimplementedError('Fetching user profile is not implemented');
  }
}
