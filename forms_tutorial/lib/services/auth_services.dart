import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{

  // sign in with google
  signInWithGoogle() async{
    // sign in process that shows the modal
     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    // obtain auth details from the request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new credential for the user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );

    //finally, sign 
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}