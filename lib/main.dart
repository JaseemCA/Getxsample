import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxsample/controller.dart';
import 'package:getxsample/second.dart';

void main() {
  // Get.put(MyController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => const MyHomePage()),
        GetPage(name: '/second', page: () => const SecondScreen())
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ConterController conterController = Get.put(ConterController());
  //Get.put(CounterController()) registers the controller, making it available for use.
  final MyController conterContrller = Get.put(MyController());
  final ColorController colorcontroller = Get.put(ColorController());
  // final MyController mycontroller = Get.find();

  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {

  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: colorcontroller.scaffoldcolor.value,
        appBar: AppBar(
          backgroundColor: colorcontroller.barcolor.value,
          title: const Text("GetX demo"),
        ),
        body: Center(
            child: Column(
          children: [
            Obx(() {
              return Text(
                'Counter: ${conterController.count}',
                style: const TextStyle(fontSize: 24),
              );
            }),
            ElevatedButton(
                onPressed: () {
                  conterContrller.printHello();
                },
                child: const Text('GetX')),
            ElevatedButton(
                onPressed: colorcontroller.changeColor,
                child: Text('change color')),
            ElevatedButton(
                onPressed: colorcontroller.changebarColor,
                child: Text('Appbar color')),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/second');
                },
                child: Text('second Screen')),
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "snackbar",
                    'Snack message',
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.amber,
                    backgroundColor: Colors.black,
                    borderRadius: 30,
                    animationDuration: Duration(seconds: 5),
                    backgroundGradient:
                        LinearGradient(colors: [Colors.white, Colors.green]),
                    isDismissible: true,
                  );
                },
                child: const Text('Snack bar')),
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog();
                  },
                child: Text('Show dialog')),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: conterController.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
