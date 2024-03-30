import 'package:flutter/material.dart';
import 'package:mi2c_mobile/model/model_berita.dart';
import 'package:http/http.dart' as http;
import 'package:mi2c_mobile/screen_page/page_login_api.dart';
import 'package:mi2c_mobile/utils/session_manager.dart';

class PageListBerit extends StatefulWidget {
  const PageListBerit({super.key});

  @override
  State<PageListBerit> createState() => _PageListBeritState();
}

class _PageListBeritState extends State<PageListBerit> {


  //method untuk get berita
  Future<List<Datum>?> getBerita() async {
    try {
      //berhasil
      http.Response response = await http
          .get(Uri.parse('http://192.168.1.4:8080/beritaDb/getBerita.php'));

      return modelBeritaFromJson(response.body).data;
      //kondisi gagal untuk mendapatkan respon api
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
  String? userName;

  //untuk mendapatkan data sesi
  Future getDataSession() async{
    await Future.delayed(const Duration(seconds: 5), (){
      session.getSession().then((value) {
        print('data sesi .. ' + value.toString());
        userName = session.userName;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    session.getSession();
    getDataSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Berita'),
        backgroundColor: Colors.cyan,
        actions: [
          TextButton(onPressed: (){}, child: Text('Hi .. ${session.userName}')),
          //logout
          IconButton(onPressed: (){
            //clear session
            setState(() {
              session.clearSession();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)
                => PageLoginApi()
              ),
                      (route) => false);
            });
          },
              icon: Icon(Icons.exit_to_app), tooltip: 'Logout',)
        ],
      ),
      body: FutureBuilder(
        future: getBerita(),
        builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                Datum? data = snapshot.data?[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: GestureDetector(
                    onTap: () {
                      //ini untuk ke detail
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://10.208.100.222:8080/beritaDb/gambar_berita/${data?.gambarBerita}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                              '${data?.judul}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                  fontSize: 18),
                            ),
                            subtitle: Text(
                              '${data?.isiBerita}',
                              maxLines: 2,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
        },
      ),
    );
  }
}
