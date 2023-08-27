import 'package:google_sign_in/google_sign_in.dart';

class googleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> handleGoogleSignIn() async {
    try {
      // This will show the Google Sign-In popup and allow the user to select an account.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // The user canceled the sign-in process.
        return;
      }

      // If the user signed in successfully, we can get their user information.
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? accessToken = googleAuth.accessToken;
      final String? idToken = googleAuth.idToken;

      print("success id is ${googleUser.email}");
print("success id is ${googleUser.displayName}");
      // You can now use the `accessToken` and `idToken` for further authentication with your backend or Firebase.
      // For example, you can send these tokens to your server to authenticate the user.

      // Do something with the user information (e.g., navigate to a new screen).
      // Replace the lines below with your desired actions.
      // Navigator.of(context).pushReplacementNamed('/home');
    } catch (error) {
      // Handle any errors that occurred during the sign-in process.
      print('Error during Google Sign-In: $error');
    }
  }
}
