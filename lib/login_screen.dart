import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade400],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tumben mbalik!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildTextField(
                    controller: _emailController,
                    hintText: 'Masukkan Alamat Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: _passwordController,
                    hintText: 'Masukkan Password',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _loginUser,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Masuk'),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'OR',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  _buildSocialLoginButton(
                    text: 'Masuk dengan Google',
                    icon: Icons.g_mobiledata,
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: _loginWithGoogle,
                  ),
                  const SizedBox(height: 15),
                  _buildSocialLoginButton(
                    text: 'Masuk dengan Facebook',
                    icon: Icons.facebook,
                    color: Colors.blue.shade800,
                    textColor: Colors.white,
                    onPressed: _loginWithFacebook,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: _forgotPassword,
                    child: const Text(
                      'Lali Password?',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Tidak memiliki Akun? ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/registration');
                        },
                        child: const Text(
                          'Daftar disini',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildSocialLoginButton({
    required String text,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _loginUser() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement login logic
      Navigator.pushNamed(context, '/landing');
    }
  }

  void _loginWithGoogle() {
    // TODO: Implement Google login
    print('Login with Google');
  }

  void _loginWithFacebook() {
    // TODO: Implement Facebook login
    print('Login with Facebook');
  }

  void _forgotPassword() {
    // TODO: Implement forgot password functionality
    print('Forgot Password');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fitur lupa password akan segera hadir')),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
