import 'package:flutter/material.dart';
import 'package:moonfin_design/moonfin_design.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// A sign-in QR on a light tile, so it scans on dark themes too.
class SignInQrCode extends StatelessWidget {
  final String data;
  final double size;

  const SignInQrCode({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorScheme.onSurface,
        borderRadius: AppRadius.circular(12),
      ),
      padding: const EdgeInsets.all(10),
      child: QrImageView(
        data: data,
        version: QrVersions.auto,
        size: size,
        backgroundColor: AppColorScheme.onSurface,
        eyeStyle: QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: AppColorScheme.background,
        ),
        dataModuleStyle: QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: AppColorScheme.background,
        ),
      ),
    );
  }
}
