import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:workpid/app/globals/globals.dart';
import 'package:workpid/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    TextStyle headerStyle({required double size}) {
      return Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: size);
    }

    return Scaffold(
      backgroundColor: ThemeConstants.themeColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Text(
                "Welcome to Workpid",
                style: headerStyle(size: 30),
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                'images/workpid_logo.jpeg',
                width: 400.w,
                height: 200.h,
              ),
              Text(
                "Login now\nTo find your best match",
                textAlign: TextAlign.center,
                style: headerStyle(size: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTField(
                  labelText: "Email",
                  textEditingController: controller.emailController,
                  iconData: Icons.email,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTField(
                  labelText: "Password",
                  textEditingController: controller.passwordController,
                  iconData: Icons.lock,
                  isObscure: true,
                ),
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      controller.showPB = true.obs;

                      // await controller
                      //     .loginUser(
                      //         passwordController: controller.passwordController,
                      //         emailController: controller.emailController)
                      //     .whenComplete(controller.showPB = false.obs);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 170, vertical: 10),
                    ),
                    child: controller.showPB.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.red[900]!),
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[900],
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            "Create Here",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
