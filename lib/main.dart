import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> languages = ["English", "Uzbek"];

List<String> word = ["In case you want to play audio or radio, record audio, provide music player UI (with basic controls like play, pause, and skip, or advanced like playback speed, playlist), visualize audio waveforms, control volume and access other audio utilities, the complete list of Flutter packages is provided below.", "Agar siz audio yoki radio tinglashni, ovoz yozishni, musiqa pleyerining UI-ni taqdim etishni (o‘ynash, to‘xtatib turish va o‘tkazib yuborish kabi asosiy boshqaruv elementlari yoki ijro tezligi, ijro ro‘yxati kabi kengaytirilgan), audio to‘lqin shakllarini vizualizatsiya qilish, ovoz balandligini boshqarish va boshqa audio yordam dasturlariga kirishni xohlasangiz, Flutter paketlarining to'liq ro'yxati quyida keltirilgan."];

class _MyHomePageState extends State<MyHomePage> {
  int selectedLanguageIndex = 0;
  bool isRecording = false;

  void toggleLanguage() {
    setState(() {
      selectedLanguageIndex = (selectedLanguageIndex + 1) % languages.length;
    });
  }

  void toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Translate",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 100,
                    child: Center(child: Text(languages[selectedLanguageIndex])),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      toggleLanguage();
                    },
                    child: Icon(
                      Icons.wifi_protected_setup_rounded,
                      size: 24.0,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Center(
                      child: Text(languages[(selectedLanguageIndex + 1) % languages.length]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      toggleRecording();
                    },
                    child: Icon(
                      isRecording ? Icons.mic_off : Icons.mic,
                      color: isRecording ? Colors.red : Colors.grey[600],
                      size: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Added space between buttons and card
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languages[selectedLanguageIndex],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        word[selectedLanguageIndex],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        languages[(selectedLanguageIndex + 1) % languages.length],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        word[(selectedLanguageIndex + 1) % languages.length],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBarEl(),
    );
  }
}

class bottomNavigationBarEl extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: 0, // current index of selected item
        onTap: (int index) {
          // handle tap
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      );
  }
}
