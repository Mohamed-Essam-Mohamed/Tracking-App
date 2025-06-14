import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                  target: LatLng(31.00221002, 30.125552211), zoom: 10),
              onMapCreated: (controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Container(
            // color:AppColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.gray),
                ),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 44,
                          width: 44,
                          child: SvgPicture.asset(
                            'assets/svg/Flowery_logo.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flowery store',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '20th st, Sheikh Zayed, Giza ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.black),
                            )
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(SvgAsset.call),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(SvgAsset.whatsapp)

                        // CircleAvatar(
                        //   radius: 44,
                        //   child: SvgPicture.asset(
                        //     'assets/svg/Flowery_logo.svg',
                        //     fit: BoxFit.fill,
                        //   ),
                        //)
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'User address',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.gray),
                ),
                const SizedBox(height: 10),
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 44,
                          width: 44,
                          child: SvgPicture.asset(
                            'assets/svg/Flowery_logo.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Flowery store',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              '20th st, Sheikh Zayed, Giza ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.black),
                            )
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(SvgAsset.call),
                        SizedBox(
                          width: 8,
                        ),
                        SvgPicture.asset(SvgAsset.whatsapp)

                        // CircleAvatar(
                        //   radius: 44,
                        //   child: SvgPicture.asset(
                        //     'assets/svg/Flowery_logo.svg',
                        //     fit: BoxFit.fill,
                        //   ),
                        //)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
