import '../core/constants/app_export.dart';

class ExitAppHandler extends StatefulWidget {
  final Widget child;

  const ExitAppHandler({Key? key, required this.child}) : super(key: key);

  @override
  _ExitAppHandlerState createState() => _ExitAppHandlerState();
}

class _ExitAppHandlerState extends State<ExitAppHandler> {
  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
            lastPressed == null ||
                now.difference(lastPressed!) > const Duration(seconds: 2);

        if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
          lastPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press again to exit'),
              duration: Duration(seconds: 2),
            ),
          );
          return false;
        }
        return true;
      },
      child: widget.child,
    );
  }
}
