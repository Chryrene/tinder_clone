import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthService with ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<bool> signIn(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'test@test.com' && password == 'password') {
      _user = User(
        id: '1',
        name: 'John Doe',
        age: 28,
        bio: 'Software developer by day, musician by night',
        images: [
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
          'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
        ],
        interests: ['Music', 'Coding', 'Travel'],
      );
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> register(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    _user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      age: 25,
      bio: 'New to Tinder',
      images: [
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
      ],
      interests: ['Meeting new people'],
    );
    notifyListeners();
    return true;
  }

  void signOut() {
    _user = null;
    notifyListeners();
  }
}
