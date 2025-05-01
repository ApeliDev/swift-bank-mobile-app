import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  // Check if the device can authenticate using biometrics (fingerprint, Face ID, etc.)
  Future<bool> canAuthenticate() async {
    bool canAuthenticateWithBiometrics = await _localAuthentication.canCheckBiometrics;
    return canAuthenticateWithBiometrics;
  }

  // Authenticate using biometrics (fingerprint, Face ID, etc.)
  Future<bool> authenticate() async {
    try {
      // The localized reason message will be shown on the authentication dialog.
      bool isAuthenticated = await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate to proceed.',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true, // Keeps the authentication on until the user cancels
        ),
      );
      return isAuthenticated;
    } catch (e) {
      print("Error during authentication: $e");
      return false;
    }
  }
}
