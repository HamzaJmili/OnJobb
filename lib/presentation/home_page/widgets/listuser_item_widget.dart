import '../../../models/Job.dart';
import '../../job_details_screen/job_details_screen.dart';
import '../controller/home_controller.dart';
import '../models/listuser_item_model.dart';
import 'package:flutter/material.dart';
import 'package:onjobb/core/app_export.dart';
import 'package:onjobb/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListuserItemWidget extends StatelessWidget {
  ListuserItemWidget({required this.job, required this.freelancerId});

final Job job;
 final String freelancerId;

  var controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {
             Get.to(
    () => JobDetailsScreen(),
    arguments: {'job': job , 'freelancerId': freelancerId}
  );
          },
          child: Container(
            margin: getMargin(
              right: 16,
            ),
            padding: getPadding(
              all: 16,
            ),
            decoration: AppDecoration.fillGray900.copyWith(
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
                    left: 12,
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
                        style: AppStyle.txtPlusJakartaSansBold14Gray50.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.07,
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 7,
                        ),
                        child: Text(
                          job.fullName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPlusJakartaSansSemiBold12.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 11,
                        ),
                        child: Text(
                         job.jobDescription.length > 70
              ? '${job.jobDescription.substring(0, 38)}\n${job.jobDescription.substring(38,60)}...'
              : job.jobDescription,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtPlusJakartaSansMedium12Gray5094
                              .copyWith(
                            letterSpacing: getHorizontalSize(
                              0.06,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 20,
                        ),
                        child: Text(
                          '\$${job.minSalary.toStringAsFixed(2)} - \$${job.maxSalary.toStringAsFixed(2)} / mois',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              AppStyle.txtPlusJakartaSansMedium12Gray50.copyWith(
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
                        child: Row(
                          children: [
                            Container(
                              width: getHorizontalSize(
                                70,
                              ),
                              padding: getPadding(
                                left: 12,
                                top: 5,
                                right: 12,
                                bottom: 5,
                              ),
                              decoration:
                                  AppDecoration.txtFillWhiteA7001e.copyWith(
                                borderRadius: BorderRadiusStyle.txtCircleBorder14,
                              ),
                              child: Text(
                                job.type,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtPlusJakartaSansMedium12Gray50a2
                                    .copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.06,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: getHorizontalSize(
                                103,
                              ),
                              margin: getMargin(
                                left: 7,
                              ),
                              padding: getPadding(
                                left: 12,
                                top: 4,
                                right: 12,
                                bottom: 4,
                              ),
                              decoration:
                                  AppDecoration.txtFillWhiteA7001e.copyWith(
                                borderRadius: BorderRadiusStyle.txtCircleBorder14,
                              ),
                              child: Text(
                                formatDate(job.publishedAt
                                .toDate()),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPlusJakartaSansMedium12Gray50a2
                                    .copyWith(
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
            ),
          ),
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
