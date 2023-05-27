import 'package:intl/intl.dart';

import '../controller/profile_controller.dart';
import '../models/profile_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ProfileItemWidget extends StatelessWidget {
  ProfileItemWidget(this.item , this.isEdu);

 

  var controller = Get.find<ProfileController>();

   final Map<String, dynamic> item;

  final bool isEdu;

  @override
   @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomIconButton(
          height: 48,
          width: 48,
          child: CustomImageView(
            svgPath: ImageConstant.imgUser48x48,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 10,
            top: 5,
            bottom: 1,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                isEdu
                    ? item['school'] ?? 'problem in school'
                    : item['title'] ?? 'problem in title',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtPlusJakartaSansSemiBold14Gray900.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.07,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 6,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: getPadding(
                        top: 1,
                      ),
                      child: Text(
                        isEdu
                            ? item['degree'] ?? 'problem in degree'
                            : item['companyName'] ?? 'problem in company name',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 3,
                        top: 1,
                      ),
                      child: Text(
                        "lbl".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        left: 4,
                        bottom: 1,
                      ),
                      child: Text(
                        '${DateFormat('MM/yyyy').format(item['startDate'])} - ${DateFormat('MM/yyyy').format(item['endDate'])}',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtPlusJakartaSansMedium12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.06,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
