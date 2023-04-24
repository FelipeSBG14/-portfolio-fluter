import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ui/colors/app_colors.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String url;
  const SocialButton({super.key, required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final Uri _url = Uri.parse(url);
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primaryColor),
        shape: MaterialStateProperty.all<CircleBorder>(
          const CircleBorder(
            side: BorderSide(color: AppColors.secColor, width: 2),
          ),
        ),
      ),
      onPressed: () async {
        await launchUrl(_url);
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          icon,
          color: AppColors.secColor,
        ),
      ),
    );
  }
}
