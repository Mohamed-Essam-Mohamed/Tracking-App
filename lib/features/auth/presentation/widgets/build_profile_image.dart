import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
  import 'package:transparent_image/transparent_image.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/features/auth/presentation/widgets/show_model_bootom_sheet.dart';
import '../../../../core/constants/app_colors.dart';
import '../view_model/cubit/edit_profile_cubit.dart';

Widget buildProfileImage(EditProfileCubit cubit, BuildContext context, String url) {
  final radius = context.sp(55);

  return Stack(
    alignment: Alignment.bottomRight,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              barrierColor: Colors.white,
              pageBuilder: (_, __, ___) => FullScreenImagePage(
                imageFile: cubit.image,
                imageUrl: url,
              ),
            ),
          );
        },
        child: Hero(
          tag: 'profileImage',
          child: ClipOval(
            child: cubit.image != null
                ? Image.file(
              cubit.image!,
              width: radius * 2,
              height: radius * 2,
              fit: BoxFit.cover,
            )
                : Stack(
              alignment: Alignment.center,
              children: [
                // Blurred loading image
                ClipOval(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Image.network(
                      url,
                      width: radius * 2,
                      height: radius * 2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Actual image fades in on top
                ClipOval(
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(url),
                    width: radius * 2,
                    height: radius * 2,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      // Camera icon button
      Positioned(
        bottom: 0,
        right: 0,
        child: InkWell(
          onTap: () => ShowModelBottomSheet(cubit, context),
          child: Container(
            width: context.wp(7.5),
            height: context.hp(4),
            decoration: BoxDecoration(
              color: AppColors.lightPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              color: AppColors.gray,
              size: context.sp(25),
            ),
          ),
        ),
      ),
    ],
  );
}

class FullScreenImagePage extends StatelessWidget {
  final File? imageFile;
  final String imageUrl;

  const FullScreenImagePage({
    Key? key,
    this.imageFile,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageProvider = imageFile != null
        ? FileImage(imageFile!)
        : NetworkImage(imageUrl) as ImageProvider;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: 'profileImage',
            child: ClipOval(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
