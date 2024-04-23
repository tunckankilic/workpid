import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:workpid/app/globals/globals.dart';
import 'package:workpid/app/modules/login/controllers/login_controller.dart';
import 'package:workpid/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<LoginController> {
  RegisterView({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());
  static const List<Tab> tabs = <Tab>[
    Tab(text: 'Credential'),
    Tab(text: 'Personal'),
    Tab(text: 'Location'),
    Tab(text: 'Appearance'),
    Tab(text: 'LifeStyle'),
    Tab(text: 'Profession'),
    Tab(text: 'Background'),
    Tab(text: 'Connections'),
    Tab(text: 'CreateTabAction'),
  ];
  @override
  Widget build(BuildContext context) {
    final TabController tabController = DefaultTabController.of(context);
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "WorkPid",
              ),
              SizedBox(
                width: 20.w,
              ),
              Image.asset(
                "images/workpid_logo.jpeg",
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
          child: TabBarView(
            children: [
              Credential(controller: controller),
              Personal(controller: controller),
              Location(controller: controller),
              Appearance(controller: controller),
              LifeStyle(controller: controller),
              Profession(controller: controller),
              Background(controller: controller),
              Connections(controller: controller),
              CreateTabAction(controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}

class CreateTabAction extends StatelessWidget {
  const CreateTabAction({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 36,
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          )),
      child: InkWell(
        onTap: () async {
          await controller
              .formValidation()
              .whenComplete(
                () => Get.snackbar("Successful", "User has been created"),
              )
              .then((value) => Get.toNamed(Routes.LOGIN));
        },
        child: const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class AppbarAction extends StatelessWidget {
  const AppbarAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Text(
            "Login Here",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class Connections extends StatelessWidget {
  const Connections({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Background - Cultural Values
        const Text(
          "Connections:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 12,
        ), //ethnicity
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.linkedInTextEditingController,
            labelText: "LinkedIn",
            iconData: CupertinoIcons.eye,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ), //ethnicity
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.instagramTextEditingController,
            labelText: "Instagram",
            iconData: CupertinoIcons.eye,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ), //ethnicity
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.githubTextEditingController,
            labelText: "GitHub",
            iconData: CupertinoIcons.eye,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Background - Cultural Values
        const Text(
          "Background - Cultural Values:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        //nationality
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.nationalityTextEditingController,
            labelText: "Nationality",
            iconData: Icons.flag_circle_outlined,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //education
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.educationTextEditingController,
            labelText: "Education",
            iconData: Icons.history_edu,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //languageSpoken
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.languageSpokenTextEditingController,
            labelText: "Language Spoken",
            iconData: CupertinoIcons.person_badge_plus_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //religion
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.religionTextEditingController,
            labelText: "Religion",
            iconData: CupertinoIcons.checkmark_seal_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //ethnicity
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.ethnicityTextEditingController,
            labelText: "Ethnicity",
            iconData: CupertinoIcons.eye,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class Profession extends StatelessWidget {
  const Profession({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //profession
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.professionTextEditingController,
            labelText: "Profession",
            iconData: Icons.business_center,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //employmentStatus
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.employmentStatusTextEditingController,
            labelText: "Employment Status",
            iconData: CupertinoIcons.rectangle_stack_person_crop_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //income
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.incomeTextEditingController,
            labelText: "Income",
            iconData: CupertinoIcons.money_dollar_circle,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //livingSituation
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.livingSituationTextEditingController,
            labelText: "Living Situation",
            iconData: CupertinoIcons.person_2_square_stack,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //willingToRelocate
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.willingToRelocateTextEditingController,
            labelText: "Are you willing to Relocate?",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class LifeStyle extends StatelessWidget {
  const LifeStyle({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Life style
        const Text(
          "Life style:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 12,
        ),
        //relationshipYouAreLookingFor
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.relationshipYouAreLookingForTextEditingController,
            labelText: "What relationship you are looking for?",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //drink
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.drinkTextEditingController,
            labelText: "Drink",
            iconData: Icons.local_drink_outlined,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //smoke
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.smokeTextEditingController,
            labelText: "Smoke",
            iconData: Icons.smoking_rooms,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //martialStatus
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.martialStatusTextEditingController,
            labelText: "Martial Status",
            iconData: CupertinoIcons.person_2,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //haveChildren
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.haveChildrenTextEditingController,
            labelText: "Do you have Children?",
            iconData: CupertinoIcons.person_3_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //noOfChildren
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.noOfChildrenTextEditingController,
            labelText: "Number of Children",
            iconData: CupertinoIcons.person_3_fill,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class Appearance extends StatelessWidget {
  const Appearance({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Appearance
        const Text(
          "Appearance:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        //height
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.heightTextEditingController,
            labelText: "Height",
            iconData: Icons.insert_chart,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //weight
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.weightTextEditingController,
            labelText: "Weight",
            iconData: Icons.table_chart,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //bodyType
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.bodyTypeTextEditingController,
            labelText: "Body Type",
            iconData: Icons.type_specimen,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //city
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.cityTextEditingController,
            labelText: "City",
            iconData: Icons.location_city,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //country
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.countryTextEditingController,
            labelText: "Country",
            iconData: Icons.location_city,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //profileHeading
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.profileHeadingTextEditingController,
            labelText: "Profile Heading",
            iconData: Icons.text_fields,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //lookingForInaPartner
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController:
                controller.lookingForInaPartnerTextEditingController,
            labelText: "What you're looking for in a partner",
            iconData: Icons.face,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

class Credential extends StatelessWidget {
  const Credential({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //email
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.emailTextEditingController,
            labelText: "Email",
            iconData: Icons.email_outlined,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
        //password
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.passwordTextEditingController,
            labelText: "Password",
            iconData: Icons.lock_outline,
            isObscure: true,
          ),
        ),
      ],
    );
  }
}

class Personal extends StatelessWidget {
  const Personal({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //personal info
        const Text(
          "Personal Info:",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(
          height: 12,
        ),

        //name
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.nameTextEditingController,
            labelText: "Name",
            iconData: Icons.person_outline,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        const SizedBox(
          height: 24,
        ),

        //age
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.ageTextEditingController,
            labelText: "Age",
            iconData: Icons.numbers,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
        //Gender
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.genderTextEditingController,
            labelText: "Gender",
            iconData: Icons.numbers,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),

        //phoneNo
        SizedBox(
          width: MediaQuery.of(context).size.width - 36,
          height: 55,
          child: CustomTField(
            textEditingController: controller.phoneNoTextEditingController,
            labelText: "Phone",
            iconData: Icons.phone,
            isObscure: false,
          ),
        ),

        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
