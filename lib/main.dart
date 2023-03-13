import 'package:flutter/material.dart';


void main() {
 runApp(const MyApp());
}


class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);
 @override
 MyAppState createState() {
   return MyAppState();
 }
}


class MyAppState extends State<MyApp> {
  String pilihanMobil	= "Brio";  // harus diletakkan di sini 
  String image = "Images/brio.jpg";

 @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> mobil = [];
    var itm1 = const DropdownMenuItem<String>(
        value: "Brio",
        child: Text("Brio"),
    );
    var itm2 = const DropdownMenuItem<String>(
        value: "Civic",
        child: Text("Civic"),
    );
    mobil.add(itm1);
    mobil.add(itm2);


    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: const <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(         
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Mobil Saya",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            image,
                            height: 100,
                          ),
                        ),

                        ElevatedButton(
                          onPressed: () {}, 
                          child: const Text('Detail')
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: DropdownButton (
                            value: pilihanMobil,
                            items: mobil,
                            onChanged: (String? newValue) {
                              setState(() {
                                  if (newValue != null) {
                                      pilihanMobil = newValue;
                                      if (pilihanMobil == 'Brio') {
                                        image = "Images/brio.jpg";
                                      } else {
                                        image = "Images/civic.jpg";
                                      }
                                  }
                              });
                            },
                          ),
                        ),
                        
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '$pilihanMobil\n',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )
                            ),
                            const TextSpan(text: 'Nomor Rangka: XXXXXXXX\n'),
                            const TextSpan(text: 'Nomor Mesin: XXXXXXXX\n'),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text('Katalog Produk'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              "Images/brv.png",
                              height: 50,
                            ),
                        ),
                        Container(
                            padding: const EdgeInsets.all(14),
                            child: Image.asset(
                              "Images/accord.png",
                              height: 80,
                            ),
                        ),
                        Container(
                            padding: EdgeInsets.all(14),
                            child: Image.asset(
                              "Images/mobilio.png",
                              height: 80,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ButtonNamaKelompok extends StatelessWidget {
 const ButtonNamaKelompok({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.account_circle_rounded),
     onPressed: () {
       // icon account di tap
       showDialog<String>(
         context: context,
         builder: (BuildContext context) => AlertDialog(
           title: const Text('Kelompok 8'),
           content: const Text('Rizal Teddyansyah (rizal17@upi.edu) ;\nHilman Fauzi Herdiana (hilmanfauzih@upi.edu)'),
           actions: <Widget>[
             TextButton(
               onPressed: () => Navigator.pop(context, 'OK'),
               child: const Text('OK'),
             ),
           ],
         ),
       );
     },
   );
 }
}


class ButtonPerjanjian extends StatelessWidget {
 const ButtonPerjanjian({Key? key}) : super(key: key);


 @override
 Widget build(BuildContext context) {
   return IconButton(
     icon: Icon(Icons.access_alarm_rounded),
     onPressed: () {
       // icon setting ditap
       const snackBar = SnackBar(
         duration: Duration(seconds: 20),
         content: Text('Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     },
   );
 }
}





