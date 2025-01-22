import 'package:flutter/material.dart';
import 'package:pawfetch_match/core/constants/app_colors.dart';
import 'package:pawfetch_match/core/helpers/app_style_helper.dart';

class PetAdoptionHistoryTile extends StatelessWidget {
  const PetAdoptionHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {

    List<(String, String)> details = [
      ("Male", "Gender"),
      ("6 yrs", "Age"),
      ("Yes", "Rescued"),
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 0.25,
              blurRadius: 0.25
          )
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/024/646/930/non_2x/ai-generated-stray-cat-in-danger-background-animal-background-photo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Samantha', style: AppStyle.shared.customTextStyle(color: AppColors.fontPrimaryColor),),
                  const SizedBox(height: 4),
                  Text('California', style: AppStyle.shared.customTextStyle(weight: FontWeight.w400, size: 14),)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('12 Jan 2025', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400, color: AppColors.primaryColor),),
                  Text('Adopted', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400, color: Colors.green),),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(details.length, (index) {
                final detail = details[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Column(
                    children: [
                      Text(detail.$1, style: AppStyle.shared.customTextStyle(color: AppColors.primaryColor),),
                      Text(detail.$2, style: AppStyle.shared.customTextStyle(weight: FontWeight.w400, size: 14),)
                    ],
                  ),
                );
              })
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Adopted By:', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                  const SizedBox(height: 2,),
                  Text('Suresh', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Adoptee Phone:', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                  const SizedBox(height: 2,),
                  Text('9889898xxx', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Previous Owner:', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                  const SizedBox(height: 2,),
                  Text('Rob', style: AppStyle.shared.customTextStyle(size: 14, weight: FontWeight.w400),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
