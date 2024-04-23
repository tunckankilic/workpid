import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:workpid/app/models/person.dart' as pM;
import 'package:workpid/app/routes/app_pages.dart';

class LoginController extends GetxController {
  static LoginController loginController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool showPB = false.obs;
  //personal info
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController ageTextEditingController = TextEditingController();
  TextEditingController phoneNoTextEditingController = TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
  TextEditingController profileHeadingTextEditingController =
      TextEditingController();
  TextEditingController lookingForInaPartnerTextEditingController =
      TextEditingController();
  TextEditingController genderTextEditingController = TextEditingController();

  //Appearance
  TextEditingController heightTextEditingController = TextEditingController();
  TextEditingController weightTextEditingController = TextEditingController();
  TextEditingController bodyTypeTextEditingController = TextEditingController();

  //Life style
  TextEditingController drinkTextEditingController = TextEditingController();
  TextEditingController smokeTextEditingController = TextEditingController();
  TextEditingController martialStatusTextEditingController =
      TextEditingController();
  TextEditingController haveChildrenTextEditingController =
      TextEditingController();
  TextEditingController noOfChildrenTextEditingController =
      TextEditingController();
  TextEditingController professionTextEditingController =
      TextEditingController();
  TextEditingController employmentStatusTextEditingController =
      TextEditingController();
  TextEditingController incomeTextEditingController = TextEditingController();
  TextEditingController livingSituationTextEditingController =
      TextEditingController();
  TextEditingController willingToRelocateTextEditingController =
      TextEditingController();
  TextEditingController relationshipYouAreLookingForTextEditingController =
      TextEditingController();

  //Connections
  TextEditingController linkedInTextEditingController = TextEditingController();
  TextEditingController instagramTextEditingController =
      TextEditingController();
  TextEditingController githubTextEditingController = TextEditingController();

  //Background - Cultural Values
  TextEditingController nationalityTextEditingController =
      TextEditingController();
  TextEditingController educationTextEditingController =
      TextEditingController();
  TextEditingController languageSpokenTextEditingController =
      TextEditingController();
  TextEditingController religionTextEditingController = TextEditingController();
  TextEditingController ethnicityTextEditingController =
      TextEditingController();

  RxBool showProgressBar = false.obs;

  late Rx<User?> firebaseCurrentUser;
  late Rx<File?> pickedFile;
  File? get profileImage => pickedFile.value;
  XFile? imageFile;

  pickImageFileFromGallery() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "you have successfully picked your profile image from galley.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  captureImageFromPhoneCamera() async {
    imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar("Profile Image",
          "you have successfully captured your profile image using camera.");
    }

    pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<String> uploadImageToStorage({required File imageFile}) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("Profile Images")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask task = referenceStorage.putFile(imageFile);
    TaskSnapshot snapshot = await task;
    String downloadImgUrl = await snapshot.ref.getDownloadURL();
    return downloadImgUrl;
  }

  createNewUserAccount({
    required File imageProfile,
    required String email,
    required String password,
    required String name,
    required int age,
    required String gender,
    required String phoneNo,
    required String city,
    required String country,
    required String profileHeading,
    required String lookingForInaPartner,
    required int publishedDateTime,
    required String height,
    required String weight,
    required String bodyType,
    required String drink,
    required String smoke,
    required String martialStatus,
    required String haveChildren,
    required String noOfChildren,
    required String profession,
    required String employmentStatus,
    required String income,
    required String livingSituation,
    required String willingToRelocate,
    required String relationshipYouAreLookingFor,
    required String nationality,
    required String education,
    required String languageSpoken,
    required String religion,
    required String ethnicity,
    required String instagramUrl,
    required String linkedInUrl,
    required String githubUrl,
  }) async {
    try {
      //User Create Method
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //Upload Img to Storage
      String urlOfDownloadedIMG =
          await uploadImageToStorage(imageFile: imageProfile);
      //Save user info to Firstore
      pM.Person personInstance = pM.Person(
          //personal info
          uid: FirebaseAuth.instance.currentUser!.uid,
          imageProfile: urlOfDownloadedIMG,
          email: email,
          password: password,
          name: name,
          age: age,
          phoneNo: phoneNo,
          city: city,
          country: country,
          profileHeading: profileHeading,
          lookingForInaPartner: lookingForInaPartner,
          publishedDateTime: DateTime.now().millisecondsSinceEpoch,
          gender: gender,

          //Appearance
          height: height,
          weight: weight,
          bodyType: bodyType,

          //Life style
          drink: drink,
          smoke: smoke,
          martialStatus: martialStatus,
          haveChildren: haveChildren,
          noOfChildren: noOfChildren,
          profession: profession,
          employmentStatus: employmentStatus,
          income: income,
          livingSituation: livingSituation,
          willingToRelocate: willingToRelocate,
          relationshipYouAreLookingFor: relationshipYouAreLookingFor,

          //Background - Cultural Values
          nationality: nationality,
          education: education,
          languageSpoken: languageSpoken,
          religion: religion,
          ethnicity: ethnicity,

          //Connection
          githubUrl: githubUrl,
          instagramUrl: instagramUrl,
          linkedInUrl: linkedInUrl);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(personInstance.toJson());

      Get.snackbar(
          "Account Created", "Congratulations, your account has been created.");
      // Get.to(HomeScreen());
    } on FirebaseAuthException {
      return;
    } catch (error) {
      return Get.snackbar("Error", "Error Occured: $error)");
    }
  }

  Future<void> loginUser(
      {required TextEditingController passwordController,
      required TextEditingController emailController}) async {
    if (passwordController.text != "" && emailController.text != "") {
      try {
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        if (userCredential.user != null) {
          Get.snackbar("Succesful", "You have been logged in ");
          Get.toNamed(Routes.HOME);
        } else {
          Get.snackbar("Error", "Error");
        }
      } on FirebaseAuthException catch (e) {
        Get.snackbar("Error", e.message ?? "An error occurred");
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    } else {
      Get.snackbar("Error", "Fill your fields");
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.toNamed(Routes.LOGIN);
  }

  checkIfUserLoggedIn({User? currentUser}) {
    if (currentUser == null) {
      Get.toNamed(Routes.LOGIN);
    } else {
      Get.toNamed(Routes.HOME);
    }
  }

  @override
  void onReady() {
    super.onReady();
    firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
    firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());
    firebaseCurrentUser.listen((user) {
      checkIfUserLoggedIn(currentUser: user);
    });
  }

  Future<void> formValidation() async {
    if (imageFile != null) {
      if (
          //personal info
          nameTextEditingController.text.trim().isNotEmpty &&
              emailTextEditingController.text.trim().isNotEmpty &&
              passwordTextEditingController.text.trim().isNotEmpty &&
              ageTextEditingController.text.trim().isNotEmpty &&
              phoneNoTextEditingController.text.trim().isNotEmpty &&
              cityTextEditingController.text.trim().isNotEmpty &&
              countryTextEditingController.text.trim().isNotEmpty &&
              profileHeadingTextEditingController.text.trim().isNotEmpty &&
              lookingForInaPartnerTextEditingController.text
                  .trim()
                  .isNotEmpty &&
              genderTextEditingController.text.trim().isNotEmpty &&

              //Appearance
              heightTextEditingController.text.trim().isNotEmpty &&
              weightTextEditingController.text.trim().isNotEmpty &&
              bodyTypeTextEditingController.text.trim().isNotEmpty &&

              //Life style
              drinkTextEditingController.text.trim().isNotEmpty &&
              smokeTextEditingController.text.trim().isNotEmpty &&
              martialStatusTextEditingController.text.trim().isNotEmpty &&
              haveChildrenTextEditingController.text.trim().isNotEmpty &&
              noOfChildrenTextEditingController.text.trim().isNotEmpty &&
              professionTextEditingController.text.trim().isNotEmpty &&
              employmentStatusTextEditingController.text.trim().isNotEmpty &&
              incomeTextEditingController.text.trim().isNotEmpty &&
              livingSituationTextEditingController.text.trim().isNotEmpty &&
              willingToRelocateTextEditingController.text.trim().isNotEmpty &&
              relationshipYouAreLookingForTextEditingController.text
                  .trim()
                  .isNotEmpty &&

              //Connections
              githubTextEditingController.text.trim().isNotEmpty &&
              instagramTextEditingController.text.trim().isNotEmpty &&
              linkedInTextEditingController.text.trim().isNotEmpty &&
              //Background - Cultural Values
              nationalityTextEditingController.text.trim().isNotEmpty &&
              educationTextEditingController.text.trim().isNotEmpty &&
              languageSpokenTextEditingController.text.trim().isNotEmpty &&
              religionTextEditingController.text.trim().isNotEmpty &&
              ethnicityTextEditingController.text.trim().isNotEmpty) {
        showProgressBar = true.obs;

        await createNewUserAccount(
          //personal info
          imageProfile: profileImage!,
          email: emailTextEditingController.text.trim(),
          password: passwordTextEditingController.text.trim(),
          name: nameTextEditingController.text.trim(),
          age: int.parse(ageTextEditingController.text.trim()),
          phoneNo: phoneNoTextEditingController.text.trim(),
          city: cityTextEditingController.text.trim(),
          country: countryTextEditingController.text.trim(),
          profileHeading: profileHeadingTextEditingController.text.trim(),
          lookingForInaPartner:
              lookingForInaPartnerTextEditingController.text.trim(),
          publishedDateTime: DateTime.now().millisecondsSinceEpoch,
          gender: genderTextEditingController.text.trim(),

          //Appearance
          height: heightTextEditingController.text.trim(),
          weight: weightTextEditingController.text.trim(),
          bodyType: bodyTypeTextEditingController.text.trim(),

          //Life style
          drink: drinkTextEditingController.text.trim(),
          smoke: smokeTextEditingController.text.trim(),
          martialStatus: martialStatusTextEditingController.text.trim(),
          haveChildren: haveChildrenTextEditingController.text.trim(),
          noOfChildren: noOfChildrenTextEditingController.text.trim(),
          profession: professionTextEditingController.text.trim(),
          employmentStatus: employmentStatusTextEditingController.text.trim(),
          income: incomeTextEditingController.text.trim(),
          livingSituation: livingSituationTextEditingController.text.trim(),
          willingToRelocate: willingToRelocateTextEditingController.text.trim(),
          relationshipYouAreLookingFor:
              relationshipYouAreLookingForTextEditingController.text.trim(),

          //Connections
          linkedInUrl: linkedInTextEditingController.text.trim(),
          instagramUrl: instagramTextEditingController.text.trim(),
          githubUrl: githubTextEditingController.text.trim(),

          //Background - Cultural Values
          nationality: nationalityTextEditingController.text.trim(),
          education: educationTextEditingController.text.trim(),
          languageSpoken: languageSpokenTextEditingController.text.trim(),
          religion: religionTextEditingController.text.trim(),
          ethnicity: ethnicityTextEditingController.text.trim(),
        );

        showProgressBar = false.obs;
        imageFile == null;
      } else {
        Get.snackbar(
            "A Field is Empty", "Please fill out all field in text fields.");
      }
    } else {
      Get.snackbar("Image File Missing",
          "Please pick image from Gallery or capture with Camera");
    }
  }
}
