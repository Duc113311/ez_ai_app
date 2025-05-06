import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditPackageCard extends StatelessWidget {
  final VoidCallback onBuyNow;
  final VoidCallback onViewAll;

  const CreditPackageCard({
    super.key,
    required this.onBuyNow,
    required this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1D6854), Color(0xFF38D9A9)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            children: [
              SvgPicture.asset('assets/icons/ic_ruby.svg',
                  width: 24, height: 24),
              const SizedBox(width: 8),
              const Text(
                'Get More Credits',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Packages Row
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PackageItem(credits: '1000', price: '\$0.99'),
              _PackageItem(credits: '5000', price: '\$4.99'),
              _PackageItem(credits: '15000', price: '\$9.99'),
            ],
          ),
          const SizedBox(height: 24),

          // Bottom Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: onBuyNow,
                child: const Text('Buy Now'),
              ),
              GestureDetector(
                onTap: onViewAll,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    const Text(
                      'View All Packages',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        decoration:
                            TextDecoration.none, // Không dùng gạch mặc định
                      ),
                    ),
                    Positioned(
                      bottom: -2, // Chỉnh khoảng cách với chữ
                      child: Container(
                        height: 1,
                        width: 120, // tùy độ dài chữ
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PackageItem extends StatelessWidget {
  final String credits;
  final String price;

  const _PackageItem({required this.credits, required this.price});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/ic_ruby.svg',
                    width: 16, height: 16),
                const SizedBox(width: 8),
                Text(
                  credits,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
