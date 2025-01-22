import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/constants/image_assets.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';
import 'package:pawfetch_match/features/pet_adoption/data/models/pet_list_model.dart';

class PetDetailInfoContainer extends StatelessWidget {
  // Data Types

  final double height;
  final Pets petDetail;

  //Constructor

  const PetDetailInfoContainer({
    super.key,
    required this.height,
    required this.petDetail,
  });

  @override
  Widget build(BuildContext context) {

    List<(String, String)> details = [
      ("Male", "Gender"),
      ("6 yrs", "Age"),
      ("Yes", "Vaccinated"),
      ("Yes", "Rescued"),
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 80,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            petDetail.name ?? '',
                            style: AppStyle.shared.customTextStyle(
                              size: 24,
                              weight: FontWeight.w600,
                              color: AppColors.fontPrimaryColor,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.pin_drop,
                                color: AppColors.fontSecondaryColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                petDetail.location ?? '',
                                style: AppStyle.shared.customTextStyle(
                                    weight: FontWeight.w400, size: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      Text(
                        "₹9,500",
                        style: AppStyle.shared.customTextStyle(
                            size: 28, color: AppColors.fontPrimaryColor),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    details.length,
                    (int index) {
                      final detail = details[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                               detail.$1,
                              style: AppStyle.shared.customTextStyle(
                                size: 18,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              detail.$2,
                              style: AppStyle.shared.customTextStyle(
                                size: 12,
                                color: AppColors.fontSecondaryColor,
                                weight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Image.network(ImageAssets.dummyProfileImgUrl),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Owned by:',
                          style: AppStyle.shared.customTextStyle(
                            size: 14,
                            weight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Steffani Wish',
                          style: AppStyle.shared.customTextStyle(size: 20),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        2,
                        (int index) {
                          return Container(
                            margin: EdgeInsets.only(left: index == 0 ? 0 : 16),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              index == 0 ? Icons.phone : Icons.chat,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey.shade50.withOpacity(0.5),
                          Colors.grey.shade50.withOpacity(0.9)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Text(
                      'This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text. This is a long text.\nThis is a long text. This is a long text. This is a long text. This is a long text. \n This is a long text.',
                      style: AppStyle.shared.customTextStyle(
                        size: 18,
                        weight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
