import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mykart/models/signup_model.dart';

class ProductProvider with ChangeNotifier {
 
  
  List<UserModel> userModelList = [];
  UserModel userModel;
  Future<void> getUserData() async {
    List<UserModel> newList = [];
    User currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser.uid == element.data()["UserId"]) {
          userModel = UserModel(
              userAddress: element.data()["UserAddress"],
              userImage: element.data()["UserImage"],
              userEmail: element.data()["UserEmail"],
              userGender: element.data()["UserGender"],
              userName: element.data()["UserName"],
              userPhoneNumber: element.data()["UserNumber"]);
          newList.add(userModel);
        }
        userModelList = newList;
      },
    );
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

  

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }

  
}
