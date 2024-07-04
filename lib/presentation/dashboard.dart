import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slice/presentation/home_screen.dart';
import 'package:slice/presentation/order/order_screen.dart';
import 'package:slice/presentation/profile/profile_screen.dart';
import '../core/constants/color_constant.dart';
import '../widgets/custom_toast.dart';
import 'order/balance_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static const List<Widget> pages = <Widget>[
    HomeScreen(),
    BalanceScreen(),
    OrderScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    toast.init(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages.elementAt(_selectedIndex)),
      bottomNavigationBar: customNavigationBar(),
    );
  }

  BottomNavigationBar customNavigationBar() {
    return BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          for (var i = 0; i < bottomNavItemList.length; i++)
            BottomNavigationBarItem(
              icon: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _selectedIndex == i
                        ? AppColors.kprimary
                        : Colors.transparent,
                  ),
                  child: Icon(bottomNavItemList[i]["icon"],
                      color: _selectedIndex == i ? AppColors.whiteA700 : null)),
              label: bottomNavItemList[i]["label"],
            ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.black900,
        unselectedItemColor: AppColors.gray.withOpacity(0.8),
        onTap: _onItemTapped,
        elevation: 8);
  }

  List<dynamic> bottomNavItemList = [
    {
      "icon": Icons.home,
      "label": "Home",
    },
    {
      "icon": Icons.wallet_rounded,
      "label": "Add Request",
    },
    {
      "icon": Icons.shopping_cart,
      "label": "Calender",
    },
    {
      "icon": Icons.person,
      "label": "Doctor",
    },
  ];
}
