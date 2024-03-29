import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/View/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/View/Chat_App/Pages/Home.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/About_Us/aboutus.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Accepted_requests/accepted_requests.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Contact_Us/provider_contact_us.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Family/family.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Result_upload/result_upload.dart';
import 'package:harees_new_project/View/User_Pages/User_services/FAQ/faq_page.dart';

import '../../View/Provider_Pages/Provider_services/Users_requests/user_requests.dart';

class ServiceIconButton extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const ServiceIconButton({
    Key? key,
    required this.serviceIcon,
    required this.serviceName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(serviceIcon, size: 40),
          onPressed: onPressed,
          color: MyColors.blue,
        ),
        SizedBox(height: 5),
        Text(
          serviceName,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MoreServicesGrid extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MoreServicesGrid(
      {super.key, required this.userModel, required this.firebaseUser});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10.0,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        ServiceIconButton(
            serviceIcon: Icons.calendar_month_outlined,
            serviceName: "Appointments".tr,
            onPressed: () {
              Get.to(() => UserRequests());
            }),
        ServiceIconButton(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Accepted appointments".tr,
          onPressed: () {
            Get.to(() => AcceptedRequests());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.list_alt,
          serviceName: "Upload Results".tr,
          onPressed: () {
            Get.to(() => ResultUpload());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.message_outlined,
          serviceName: "Contact Us".tr,
          onPressed: () {
            Get.to(() => ProviderContact());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.family_restroom,
          serviceName: "Family".tr,
          onPressed: () {
            Get.to(() => Family());
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.chat_bubble_outline,
          serviceName: "Chats".tr,
          onPressed: () {
            Get.to(() => Home(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                ));
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.info,
          serviceName: "About us".tr,
          onPressed: () {
            Get.to(() => AboutUsPage(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                ));
          },
        ),
        ServiceIconButton(
          serviceIcon: Icons.question_answer,
          serviceName: "FAQ".tr,
          onPressed: () {
            Get.to(() => FAQ());
          },
        ),
      ],
    );
  }
}
