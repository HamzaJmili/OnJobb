import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthHelper {
  /// Handle Google Signin to authenticate user
  /// 
  /// 

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithGoogle() async {
    // Step 1: Trigger the Google Sign-in flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return null; // User canceled the sign-in flow
    }

    try {
      // Step 2: Obtain the Google auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Step 3: Create a Firebase credential using the Google tokens
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in or sign up the user with Firebase using the credential
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      return userCredential;
    } catch (e) {
      print('Failed to sign in with Google: $e');
      return null;
    }
  }
























  
  Future<GoogleSignInAccount?> googleSignInProcess() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser != null) {
      return googleUser;
    }
  }

  /// To Check if the user is already signedin through google
  alreadySignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    bool alreadySignIn = await _googleSignIn.isSignedIn();
    return alreadySignIn;
  }

  /// To signout from the application if the user is signed in through google
  Future<GoogleSignInAccount?> googleSignOutProcess() async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleUser = await _googleSignIn.signOut();

    return googleUser;
  }
}
