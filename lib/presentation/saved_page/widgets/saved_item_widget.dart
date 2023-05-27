import '../../../models/Job.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_button.dart';

import '../controller/saved_controller.dart';

class SavedItemWidget extends StatelessWidget {
    SavedController controller = Get.put(SavedController());

  SavedItemWidget(this.job,
      {this.onTapSaveJobDetails, required this.isFreelancer});

  final Job job;
  final VoidCallback? onTapSaveJobDetails;
  final bool isFreelancer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSaveJobDetails?.call();
      },
      child: Container(
        padding: getPadding(
          all: 16,
        ),
        decoration: AppDecoration.outlineIndigo50.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(job.imageUrl),
              radius: 24,
            ),
            Padding(
              padding: getPadding(
                left: 10,
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPlusJakartaSansBold16.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.08,
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 6,
                    ),
                    child: Text(
                      job.fullName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtPlusJakartaSansSemiBold12Bluegray300
                          .copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 10,
                    ),
                    child: Text(
                      "\$${job.minSalary} -\$${job.maxSalary.toString()} /month",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style:
                          AppStyle.txtPlusJakartaSansMedium12Gray600.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.06,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 13,
                    ),
                    child: Row(
                      children: [
                        CustomButton(
                          height: getVerticalSize(
                            28,
                          ),
                          width: getHorizontalSize(
                            70,
                          ),
                          text: job.type,
                          variant: ButtonVariant.FillGray100,
                          shape: ButtonShape.RoundedBorder8,
                        ),
                        CustomButton(
                          height: getVerticalSize(
                            28,
                          ),
                          width: getHorizontalSize(
                            103,
                          ),
                          text: formatDate(job.publishedAt.toDate()),
                          margin: getMargin(
                            left: 8,
                          ),
                          variant: ButtonVariant.FillGray100,
                          shape: ButtonShape.RoundedBorder8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomImageView(
              svgPath: isFreelancer
                  ? ImageConstant.imgBookmark1
                  : ImageConstant.imgTrash,
              height: getSize(
                24,
              ),
              width: getSize(
                24,
              ),
              margin: getMargin(
                left: 30,
                bottom: 92,
              ),
              onTap: () {
                isFreelancer
                    ? controller.deleteFromSavedJobs(job.id)
                    : controller.deleteClientJob(job.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays < 3) {
      if (difference.inHours < 1) {
        if (difference.inMinutes < 1) {
          return 'Just now';
        } else {
          return '${difference.inMinutes} minutes ago';
        }
      } else if (difference.inHours < 24) {
        return '${difference.inHours} hours ago';
      } else {
        return '${difference.inDays} days ago';
      }
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
