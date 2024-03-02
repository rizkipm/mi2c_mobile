import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mi2c_mobile/page_beranda.dart';

void main() {
  runApp(const MyApp());
}

//stateless : widget statis
//statefull : dinamis
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageBeranda(),
    );
  }
}

//untuk membuat class --> ketik st
//contoh hirarki single
// class PageUtama extends StatelessWidget {
//   const PageUtama({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Project MI2C'),
//
//       ),
//       body: Center(
//         child: Text('Ini adalah Project Pertama'),
//       ),
//     );
//   }
// }

//contoh hirarki multiple

class PageUtama extends StatelessWidget {
  const PageUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar : properti
      //AppBar : class atau widget
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Project MI2C'),
      ),
      body: Center(
        //child  : hanya bisa menampung 1 widget
        //children :bisa menampung lebih dari 1 widget --> widget berupa array []
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: NetworkImage(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
              fit: BoxFit.contain,
              height: 200,
              width: 200,
            ),
            Text('Program Studi : Manajemen Informatika 2C'),
            Text('Kampus Politeknik Negeri Padang'),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Fluttertoast.showToast(
                    msg: "This is Center Short Toast",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Text(
                'Explore More',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              color: Colors.green,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                showToast('This is toast',
                    context: context,
                    axis: Axis.horizontal,
                    alignment: Alignment.center,
                    position: StyledToastPosition.bottom);
              },
              child: Text(
                'Klik Disini',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
