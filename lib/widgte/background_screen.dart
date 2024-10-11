import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/asset_image.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [

          SvgPicture.asset(AssetPath.BackgroundImage,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
          ),
         child,
        ],
      ),
    );
  }
}
