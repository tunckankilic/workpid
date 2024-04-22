import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  //personal info
  String? uid;
  String? imageProfile;
  String? email;
  String? password;
  String? name;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInaPartner;
  int? publishedDateTime;
  String? gender;

  //Appearance
  String? height;
  String? weight;
  String? bodyType;

  //Life style
  String? drink;
  String? smoke;
  String? martialStatus;
  String? haveChildren;
  String? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //Background - Cultural Values
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  //Connections
  String? instagramUrl;
  String? linkedInUrl;
  String? githubUrl;

  Person({
    //personal info
    this.uid,
    this.imageProfile,
    this.email,
    this.password,
    this.name,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInaPartner,
    this.publishedDateTime,
    this.gender,

    //Appearance
    this.height,
    this.weight,
    this.bodyType,

    //Life style
    this.drink,
    this.smoke,
    this.martialStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    //Background - Cultural Values
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,

    //Connections
    this.githubUrl,
    this.instagramUrl,
    this.linkedInUrl,
  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
        //personal info
        uid: dataSnapshot["uid"],
        name: dataSnapshot["name"],
        imageProfile: dataSnapshot["imageProfile"],
        email: dataSnapshot["email"],
        password: dataSnapshot["password"],
        age: dataSnapshot["age"],
        phoneNo: dataSnapshot["phoneNo"],
        city: dataSnapshot["city"],
        country: dataSnapshot["country"],
        profileHeading: dataSnapshot["profileHeading"],
        lookingForInaPartner: dataSnapshot["lookingForInaPartner"],
        publishedDateTime: dataSnapshot["publishedDateTime"],
        gender: dataSnapshot["gender"],

        //Appearance
        height: dataSnapshot["height"],
        weight: dataSnapshot["weight"],
        bodyType: dataSnapshot["bodyType"],

        //Life style
        drink: dataSnapshot["drink"],
        smoke: dataSnapshot["smoke"],
        martialStatus: dataSnapshot["martialStatus"],
        haveChildren: dataSnapshot["haveChildren"],
        noOfChildren: dataSnapshot["noOfChildren"],
        profession: dataSnapshot["profession"],
        employmentStatus: dataSnapshot["employmentStatus"],
        income: dataSnapshot["income"],
        livingSituation: dataSnapshot["livingSituation"],
        willingToRelocate: dataSnapshot["willingToRelocate"],
        relationshipYouAreLookingFor:
            dataSnapshot["relationshipYouAreLookingFor"],

        //Background - Cultural Values
        nationality: dataSnapshot["nationality"],
        education: dataSnapshot["education"],
        languageSpoken: dataSnapshot["languageSpoken"],
        religion: dataSnapshot["religion"],
        ethnicity: dataSnapshot["ethnicity"],

        //Connections
        linkedInUrl: dataSnapshot["linkedIn"],
        instagramUrl: dataSnapshot["instagram"],
        githubUrl: dataSnapshot["github"]);
  }

  Map<String, dynamic> toJson() => {
        //personal info
        "uid": uid,
        "imageProfile": imageProfile,
        "email": email,
        "password": password,
        "name": name,
        "age": age,
        "phoneNo": phoneNo,
        "city": city,
        "country": country,
        "profileHeading": profileHeading,
        "lookingForInaPartner": lookingForInaPartner,
        "publishedDateTime": publishedDateTime,
        "gender": gender,

        //Appearance
        "height": height,
        "weight": weight,
        "bodyType": bodyType,

        //Life style
        "drink": drink,
        "smoke": smoke,
        "martialStatus": martialStatus,
        "haveChildren": haveChildren,
        "noOfChildren": noOfChildren,
        "profession": profession,
        "employmentStatus": employmentStatus,
        "income": income,
        "livingSituation": livingSituation,
        "willingToRelocate": willingToRelocate,
        "relationshipYouAreLookingFor": relationshipYouAreLookingFor,

        //Background - Cultural Values
        "nationality": nationality,
        "education": education,
        "languageSpoken": languageSpoken,
        "religion": religion,
        "ethnicity": ethnicity,

        //Connections
        "linkedIn": linkedInUrl,
        "instagram": instagramUrl,
        "github": githubUrl,
      };
}
