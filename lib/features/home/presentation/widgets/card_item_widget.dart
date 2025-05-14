import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:tracking_app/core/common/widget/custom_cache_network_image.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';

class CardItemWidget extends StatefulWidget {
  const CardItemWidget({
    required this.title,
    required this.image,
    required this.address,
    super.key,
  });
  final String title;
  final String image;
  final String address;

  @override
  State<CardItemWidget> createState() => _CardItemWidgetState();
}

class _CardItemWidgetState extends State<CardItemWidget> {
  String finalAddress = '';

  @override
  void initState() {
    super.initState();
    setAddressValue();
  }

  void setAddressValue() async {
    finalAddress = await _getAddressFromLatLong(widget.address);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: ListTile(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.white[AppColors.colorCode90],
              ),
        ),
        subtitle: Row(
          children: [
            SvgPicture.asset(
              SvgAsset.location,
              colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                finalAddress,
                style: Theme.of(context).textTheme.labelMedium,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        leading: CustomCacheNetworkImage(
          imageUrl: _checkImageUrl(widget.image) ?? imageCover,
          isCircular: true,
          width: 44,
          height: 44,
        ),
      ),
    );
  }

  String? _checkImageUrl(String image) {
    final uri = Uri.tryParse(image);

    if (uri == null || !(uri.isAbsolute)) {
      return null;
    }
    return image;
  }

  Future<String> _getAddressFromLatLong(String latLong) async {
    try {
      final parts = latLong.split(',');
      final lat = double.tryParse(parts[0]);
      final lng = double.tryParse(parts[1]);

      if (lat == null || lng == null) return 'Invalid coordinates';

      final List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);

      if (placeMarks.isNotEmpty) {
        final place = placeMarks.first;
        return '${place.street}, ${place.locality}, ${place.country}';
      } else {
        return 'No address found';
      }
    } catch (e) {
      return 'Error getting address: $e';
    }
  }
}
