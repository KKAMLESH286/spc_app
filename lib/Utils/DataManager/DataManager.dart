// import 'dart:async';

// import 'package:dmarketplace/Utils/frequent_utils.dart';

// import 'package:dmarketplace/WebServices/repository.dart';
// import 'package:dmarketplace/model/CheckInModel/GPSTrackModel.dart';

// import 'package:dmarketplace/model/login/LoginResponse.dart';
// import 'package:dmarketplace/views/NotificationScreen/NotificationController.dart';
// import 'package:dmarketplace/views/Profile/ProfileController.dart';
// import 'package:fbroadcast/fbroadcast.dart';
// import 'package:intl/intl.dart';
// import 'package:location/location.dart';

// import '../../WebServices/ApiBaseHelper.dart';

// class DataManager {
//   static DataManager shared = DataManager();

//   DataManager() {
//     profileController = ProfileController();
//     profileController.getProfileResponse(onResponse: (profile) {
//       FBroadcast.instance().broadcast("BroadcastKey");
//     });
//   }

//   List<UserDetails> userlist;
//   var loggedInUserId = 0;
//   var bearerToken = "token";
//   var fcmToken = "";

//   ProfileController profileController;
//   NotificationController notificationController;

//   int timer = 0;
//   Timer locationTimer;
//   List<Map<String, dynamic>> trackData = new List<Map<String, dynamic>>();
//   void checkTimerGeoLocation() {
//     locationTimer = Timer.periodic(
//         Duration(seconds: 30), (Timer t) => checkGeoLocationIsValid());
//   }

//   void checkTimerLocation() {
//     locationTimer = Timer.periodic(
//         Duration(seconds: 30), (Timer t) => checkGeoLocationIsValid());
//   }

//   void checkGeoLocationIsValid() async {
//     timer += 1;
//     Location _locationTracker = new Location();
//     var location = await _locationTracker.getLocation();
//     String formattedDate =
//         DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now());
//     print("formatted date" + formattedDate);
//     //create params and add to list
//     Map<String, dynamic> locationData = Map<String, dynamic>();
//     locationData.putIfAbsent(ApiBaseHelper.latitude, () => location.latitude);
//     locationData.putIfAbsent(ApiBaseHelper.longitude, () => location.longitude);
//     locationData.putIfAbsent(ApiBaseHelper.accuracy, () => location.accuracy);
//     locationData.putIfAbsent(ApiBaseHelper.alltitude, () => location.altitude);
//     locationData.putIfAbsent(
//         ApiBaseHelper.speedAccuracy, () => location.speedAccuracy);
//     locationData.putIfAbsent(ApiBaseHelper.trackTime, () => formattedDate);
//     trackData.add(locationData);
//     if (timer >= 6) {
//       final Repository _repository = Repository();
//       bool isConnected = await FrequentUtils.isNetworkAvailable();
//       print("Timer Working");
//       if (isConnected) {
//         timer = 0;
//         GPSResponseModel response = await _repository.getTreackingIn(trackData);
//         print(response);
//       }
//     }
//   }
// }



// // import 'dart:async';

// // import 'package:dmarketplace/Utils/frequent_utils.dart';

// // import 'package:dozzbee/WebServices/repository.dart';
// // import 'package:dozzbee/model/CheckInModel/GPSTrackModel.dart';
// // import 'package:dozzbee/model/login/LoginResponse.dart';
// // import 'package:dozzbee/views/NotificationScreen/NotificationController.dart';
// // import 'package:dozzbee/views/Profile/ProfileController.dart';
// // // import 'package:dozzbee/views/Profile/ProfileController.dart';
// // import 'package:fbroadcast/fbroadcast.dart';
// // import 'package:intl/intl.dart';
// // import 'package:location/location.dart';

// // import '../../WebServices/ApiBaseHelper.dart';

// // class DataManager {
// //   static DataManager shared = DataManager();
// //   // DataManager();

// //   DataManager() {
// //     profileController = ProfileController();
// //     profileController.getProfileResponse(onResponse: (profile) {
// //       FBroadcast.instance().broadcast("BroadcastKey");
// //     });
// //   }
// //   List<UserDetails> userlist;
// //   var loggedInUserId = 0;
// //   var bearerToken = "token";
// //   ProfileController profileController;
// //   NotificationController notificationController;

// //   int timer = 0;
// //   Timer locationTimer;
// //   List<Map<String, dynamic>> trackData = [];
// //   void checkTimerGeoLocation() {
// //     locationTimer = Timer.periodic(
// //         Duration(seconds: 30), (Timer t) => checkGeoLocationIsValid());
// //   }

// //   void checkGeoLocationIsValid() async {
// //     timer += 1;
// //     Location _locationTracker = new Location();
// //     var location = await _locationTracker.getLocation();
// //     String formattedDate =
// //         DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(DateTime.now());
// //     print("formatted date" + formattedDate);
// //     //create params and add to list
// //     Map<String, dynamic> locationData = Map<String, dynamic>();
// //     locationData.putIfAbsent(ApiBaseHelper.latitude, () => location.latitude);
// //     locationData.putIfAbsent(ApiBaseHelper.longitude, () => location.longitude);
// //     locationData.putIfAbsent(ApiBaseHelper.accuracy, () => location.accuracy);
// //     locationData.putIfAbsent(ApiBaseHelper.alltitude, () => location.altitude);
// //     locationData.putIfAbsent(
// //         ApiBaseHelper.speedAccuracy, () => location.speedAccuracy);
// //     locationData.putIfAbsent(ApiBaseHelper.trackTime, () => formattedDate);
// //     trackData.add(locationData);
// //     if (timer >= 6) {
// //       final Repository _repository = Repository();
// //       bool isConnected = await FrequentUtils.isNetworkAvailable();
// //       print("Timer Working");
// //       if (isConnected) {
// //         timer = 0;
// //         GPSResponseModel response = await _repository.getTreackingIn(trackData);
// //         print(response);
// //       }
// //     }
// //   }
// // }
