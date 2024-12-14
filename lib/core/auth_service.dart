import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Google only
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Ensure that only users present in Firebase authentication can proceed
        if (userCredential.user != null) {
          final User? user = userCredential.user;
          final String? email = user?.email;
          if (email != null) {
            final List<String> methods =
                await _auth.fetchSignInMethodsForEmail(email);
            if (methods.contains('google.com') && user!.emailVerified) {
              print("User logged in with Google: ${user.email}");
              return user;
            } else {
              print(
                  "Google account email not verified or user not authorized. Access denied.");
              return null;
            }
          }
        }
      } else {
        print("Google Sign-In was canceled by the user.");
        return null;
      }
    } catch (e) {
      print("Google Sign-In failed: $e");
      return null;
    }
  }

  // Email and password login
  Future<User?> loginUser(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Ensure that only users present in Firebase authentication can proceed
      if (userCredential.user != null) {
        final User? user = userCredential.user;
        if (user != null && user.emailVerified) {
          print("User logged in with email: ${user.email}");
          return user;
        } else {
          print("Email not verified or user not authorized. Access denied.");
          return null;
        }
      }
    } catch (e) {
      print("Login failed: $e");
      return null;
    }
  }
}
