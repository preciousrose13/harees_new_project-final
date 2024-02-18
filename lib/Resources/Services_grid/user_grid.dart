import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harees_new_project/View/Chat_App/Models/user_models.dart';
import 'package:harees_new_project/Resources/AppColors/app_colors.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/About_Us/aboutus.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Accepted_requests/accepted_requests.dart';
import 'package:harees_new_project/View/Provider_Pages/Provider_services/Family/family.dart';
import 'package:harees_new_project/View/User_Pages/User_services/Contact_us/user_contact_us.dart';
import 'package:harees_new_project/View/User_Pages/User_services/FAQ/faq_page.dart';
import 'package:harees_new_project/View/User_Pages/User_services/Results/results.dart';
import 'package:harees_new_project/View/User_Pages/User_services/User_appointments/User_appointments.dart';

class UserGridServices extends StatelessWidget {
  final IconData serviceIcon;
  final String serviceName;
  final VoidCallback onPressed;

  const UserGridServices({
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

class UserServicesGrid extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const UserServicesGrid(
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
        UserGridServices(
          serviceIcon: Icons.calendar_month_outlined,
          serviceName: "Appointments".tr,
          onPressed: () {
            Get.to(() => MyAppointments(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                ));
          },
        ),
        UserGridServices(
          serviceIcon: Icons.add_box_outlined,
          serviceName: "Accepted appointments".tr,
          onPressed: () {
            Get.to(() => AcceptedRequests());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.list_alt,
          serviceName: "See result".tr,
          onPressed: () {
            Get.to(() => UserResult());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.message_outlined,
          serviceName: "Contact Us".tr,
          onPressed: () {
            Get.to(() => UserContact());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.family_restroom,
          serviceName: "Family".tr,
          onPressed: () {
            Get.to(() => Family());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.question_answer,
          serviceName: "FAQ".tr,
          onPressed: () {
            Get.to(() => FAQ());
          },
        ),
        UserGridServices(
          serviceIcon: Icons.info,
          serviceName: "About us".tr,
          onPressed: () {
            Get.to(() => AboutUsPage(
                  userModel: userModel,
                  firebaseUser: firebaseUser,
                ));
          },
        ),
      ],
    );
  }
}
