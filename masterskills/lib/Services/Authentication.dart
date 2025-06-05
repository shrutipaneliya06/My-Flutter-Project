import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterskills/Services/Storage.dart';

class Authentication extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SecureStorage secureStorage = SecureStorage();

  Future<String> googleSignIn() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);
      final User user = userCredential.user;
      assert(user.displayName != null);
      assert(user.email != null);

      final User currentUser = _firebaseAuth.currentUser;
      assert(currentUser.uid == user.uid);

      secureStorage.writeSecureData('email', user.email);
      secureStorage.writeSecureData('name', user.displayName);

      return 'success';
    } catch (e) {
      return 'Error Occured';
    }
  }

  // Future<Null> googleSignOut() async {
  //   // Sign out with firebase
  //   await _firebaseAuth.signOut();
  //   // Sign out with google
  //   // await googleSignIn.signOut();
  // }
  Future<String> googleSignOut() async {
    await _googleSignIn.signOut();
    // await FirebaseAuth.instance.signOut();
    return 'Error Out';
  }
}
