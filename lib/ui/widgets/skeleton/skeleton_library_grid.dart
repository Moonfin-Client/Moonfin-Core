import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../preference/preference_constants.dart';
import '../../../preference/user_preferences.dart';
import 'skeleton_shimmer.dart';

/// Skeleton placeholder grid displayed while a media library or collection is loading.
class SkeletonLibraryGrid extends StatelessWidget {
  final double? cardWidth;
  final double aspectRatio;
  final int itemCount;
  final bool isSongs;
  final bool isHorizontal;

  const SkeletonLibraryGrid({
    super.key,
    this.cardWidth,
    this.aspectRatio = 2 / 3,
    this.itemCount = 20,
    this.isSongs = false,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = isSongs
        ? _buildSongsSkeleton(context)
        : (isHorizontal ? _buildHorizontalSkeleton(context) : _buildVerticalSkeleton(context));
    return SkeletonShimmer(child: content);
  }

  Widget _buildSongsSkeleton(BuildContext context) {
    final prefs = GetIt.instance.isRegistered<UserPreferences>()
        ? GetIt.instance<UserPreferences>()
        : null;
    final hasLeftSidebar = prefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
    final hPad = hasLeftSidebar ? 120.0 : 40.0;

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(hPad, 8, hPad, 32),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 14,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              SkeletonBox(width: 44, height: 44, borderRadius: BorderRadius.circular(6)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: 220, height: 14, borderRadius: BorderRadius.circular(4)),
                    const SizedBox(height: 6),
                    SkeletonBox(width: 140, height: 12, borderRadius: BorderRadius.circular(4)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SkeletonBox(width: 50, height: 12, borderRadius: BorderRadius.circular(4)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVerticalSkeleton(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final prefs = GetIt.instance.isRegistered<UserPreferences>()
            ? GetIt.instance<UserPreferences>()
            : null;
        final hasLeftSidebar = prefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
        final horizontalPadding = hasLeftSidebar ? 120.0 : 40.0;
        final targetWidth = cardWidth ?? 150.0;
        const spacing = 16.0;

        final crossAxisCount = ((constraints.maxWidth - horizontalPadding * 2 + spacing) /
                (targetWidth + spacing))
            .floor()
            .clamp(2, 20);

        final cellWidth = (constraints.maxWidth -
                horizontalPadding * 2 -
                (crossAxisCount - 1) * spacing) /
            crossAxisCount;
        final imageHeight = cellWidth / aspectRatio;
        const textHeight = 36.0;
        final cellHeight = imageHeight + textHeight;
        final childAspectRatio = cellWidth / cellHeight;

        return GridView.builder(
          padding: EdgeInsets.fromLTRB(horizontalPadding, 16, horizontalPadding, 32),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: spacing,
            crossAxisSpacing: spacing,
            childAspectRatio: childAspectRatio,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SkeletonBox(
                    width: double.infinity,
                    height: double.infinity,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 8),
                SkeletonBox(
                  width: cellWidth * 0.75,
                  height: 14,
                  borderRadius: BorderRadius.circular(4),
                ),
                const SizedBox(height: 4),
                SkeletonBox(
                  width: cellWidth * 0.45,
                  height: 12,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHorizontalSkeleton(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final prefs = GetIt.instance.isRegistered<UserPreferences>()
            ? GetIt.instance<UserPreferences>()
            : null;
        final hasLeftSidebar = prefs?.get(UserPreferences.navbarPosition) == NavbarPosition.left;
        final horizontalPadding = hasLeftSidebar ? 120.0 : 40.0;
        final targetWidth = cardWidth ?? 150.0;
        final imageHeight = targetWidth / aspectRatio;

        return ListView.builder(
          padding: EdgeInsets.fromLTRB(horizontalPadding, 16, horizontalPadding, 32),
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: targetWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: targetWidth,
                      height: imageHeight,
                      child: SkeletonBox(
                        width: double.infinity,
                        height: double.infinity,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SkeletonBox(
                      width: targetWidth * 0.75,
                      height: 14,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    const SizedBox(height: 4),
                    SkeletonBox(
                      width: targetWidth * 0.45,
                      height: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
