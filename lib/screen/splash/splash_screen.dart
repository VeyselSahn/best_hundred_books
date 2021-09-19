import 'package:best_hundred_books/core/service/data_service.dart';
import 'package:best_hundred_books/screen/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      final data = Provider.of<DataService>(context, listen: false);
      data.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataService>(
          builder: (context, value, child) =>
              value.loading == true ? loading() : MainScreen(service: value)),
    );
  }

  Widget loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text(
            'Loading',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
