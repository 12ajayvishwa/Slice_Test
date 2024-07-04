import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:slice/utils/internet_connectivity_controller.dart';
import 'package:slice/utils/notification_service.dart';
import 'package:slice/widgets/custom_toast.dart';
import 'package:slice/widgets/exit_app.dart';
import 'controllers/auth_controller.dart';
import 'core/constants/app_export.dart';
import 'core/constants/session_manager.dart';
import 'routes/app_routes.dart';

String? deviceName;
String? deviceType;
String? version;
// IP address of the device
Position? currentPosition;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  await Firebase.initializeApp();
  await NotificationService().initNotification();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  final AuthController authController = Get.put(AuthController());
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  @override
  void initState() {
    getDeviceInfo();
    _fetchLocation();
    super.initState();
  }

  //For DiviceInfo
  getDeviceInfo() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        deviceName = androidInfo.model;
        deviceType = "android";
        version = androidInfo.version.release;
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
        deviceName = iosInfo.name;
        deviceType = "ios";
        version = iosInfo.systemVersion;
      });
    }
  }

  //For get LatLng
  Future<void> _fetchLocation() async {
    final hasPermission = await _handleLocationPermission();
    try {
      if (!hasPermission) return;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) {
        setState(() => currentPosition = position);
      }).catchError((e) {
        debugPrint(e);
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

//Location permission
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ExitAppHandler(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.SPLASHSCREEN,
            getPages: AppRoutes.pages,
            // home: HomeScreen(),
          ),
        );
      },
    );
  }
}
