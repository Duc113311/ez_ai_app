import 'package:flutter/material.dart';

class SignInPromoCard extends StatelessWidget {
  final VoidCallback onSignInPressed;

  const SignInPromoCard({
    super.key,
    required this.onSignInPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F1ED), // light green-gray background
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Text content
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Sign in now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Sign up now and get 2000 free credits\nas a new user!',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // Sign in button
          GestureDetector(
            onTap: onSignInPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1D6854), Color(0xFF38D9A9)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
