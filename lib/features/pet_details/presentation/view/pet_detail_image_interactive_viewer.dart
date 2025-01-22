import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/shared/widgets/custom_app_bar.dart';
import 'package:pawfetch_match/shared/widgets/custom_icon_button.dart';

class PetDetailImageInteractiveViewer extends StatelessWidget {

  final String imageUrl;

  const PetDetailImageInteractiveViewer({super.key, required this.imageUrl,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: CustomIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          assetName: ImageAssets.backArrow,
        ),
        title: 'Pet Gallery',
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            color: Colors.red,
            child: InteractiveViewer(
              panEnabled: false, // Set it to false
              boundaryMargin: EdgeInsets.all(100),
              minScale: 1,
              maxScale: 5,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
