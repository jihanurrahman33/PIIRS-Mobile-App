import 'package:flutter/material.dart';

/// Hero media card showcasing issue photo evidence and gallery action.
class IssueEvidenceHeroWidget extends StatelessWidget {
  final VoidCallback onGalleryTap;

  const IssueEvidenceHeroWidget({super.key, required this.onGalleryTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGalleryTap,
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/stitch/pothole_hazard.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.blueGrey.shade100,
                  child: const Icon(Icons.broken_image_rounded, size: 48),
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              right: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPill('⚠️ Road Hazard'),
                  _buildPill('1 of 3 Photos'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
