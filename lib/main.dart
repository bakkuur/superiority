/*
import 'package:flutter/material.dart';
void main(){
  runApp(MyAppl());
}
class MyAppl extends StatelessWidget {
  const MyAppl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'AL-Tafawuq School',
      theme: ThemeData(
   //     primarySwatch: Colors.grey,
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// --- صفحة تسجيل الدخول ---
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Icon(Icons.school, size: 120, color: Colors.blueAccent),
              const SizedBox(height: 25),
              const Text(
                "AL-Tafawuq Model School",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 60),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("الرجاء إدخال البريد وكلمة المرور")),
                      );
                    }
                  },
                  child: const Text("LOGIN", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium), label: 'عن المدرسة'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'موقع المدرسة'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_support_outlined), label: 'الدعم الفني'),
        ],
        onTap: (index) {},
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("AL-Tafawuq Model School", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 190,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://tse3.mm.bing.net/th/id/OIP.BnhoRYGA3a-4mGQEVjXO-QHaGj?rs=1&pid=ImgDetMain&o=7&rm=3',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("AL-Tafawuq Model School", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  buildBox(context, "نتائج الطلاب", Icons.grading, Colors.blue),
                  buildBox(context, "الجدول الدراسي", Icons.calendar_month, Colors.orange),
                  buildBox(context, "أوائل الفصل", Icons.emoji_events, Colors.amber),
                  buildBox(context, "الرسوم الدراسية", Icons.payments, Colors.green),
                  buildBox(context, "الغياب والحضور", Icons.how_to_reg, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Colors.purple),
              ),
              accountName: Text("Gawad Alsalahi"),
              accountEmail: Text("Student ID : 1234"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DataOnePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu),
              title: const Text('Operations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DatatwoPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.blueAccent),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBox(BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(title: title))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// --- صفحة التفاصيل (التي تحتوي على الجداول المضافة) ---
class DetailsPage extends StatelessWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    if (title == "الجدول الدراسي") {
      return _buildTimetable();
    } else if (title == "نتائج الطلاب") {
      return _buildResultsTable();
    } else {
      return Center(child: Text("محتوى صفحة $title سيتم إضافته قريباً"));
    }
  }

  // --- جدول الحصص ---
  Widget _buildTimetable() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Text("🗓️ Weekly Class Timetable",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildRow(["Day", "Period 1", "Period 2", "Period 3"], isHeader: true),
            _buildRow(["Sun", "Math", "Physics", "English"]),
            _buildRow(["Mon", "Arabic", "Biology", "IT"]),
            _buildRow(["Tue", "Chemistry", "Math", "History"]),
            _buildRow(["Wed", "Physics", "English", "Sports"]),
            _buildRow(["Thu", "Biology", "Quran", "Art"]),
          ],
        ),
      ],
    );
  }

  // --- جدول النتائج ---
  Widget _buildResultsTable() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Text("📊 Academic Results",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildRow(["Subject", "Score", "Grade"], isHeader: true),
            _buildRow(["Mathematics", "98", "A+"]),
            _buildRow(["Physics", "92", "A"]),
            _buildRow(["Computer Science", "100", "A+"]),
            _buildRow(["English Language", "85", "B+"]),
          ],
        ),
      ],
    );
  }

  // دالة بناء الصفوف للجداول
  TableRow _buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.blue.shade50 : Colors.white),
      children: cells
          .map((text) => Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
              ))
          .toList(),
    );
  }
}

class DataOnePage extends StatelessWidget {
  const DataOnePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Settings"), backgroundColor: Colors.purple, foregroundColor: Colors.white),
        body: const Center(child: Text("واجهة الإعدادات")),
      );
}

class DatatwoPage extends StatelessWidget {
  const DatatwoPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text("Operations"), backgroundColor: Colors.purple, foregroundColor: Colors.white),
        body: const Center(child: Text("واجهة العمليات")),
      );
}
*/

import 'dart:io';

import 'package:flutter/material.dart';
void main(){
  runApp(MyAppl());
}
class MyAppl extends StatelessWidget {
  const MyAppl({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AL-Tafawuq School',
      theme: ThemeData(

        //useMaterial3: gzip,
     //   primarySwatch: Colors.blue,

      ),
      home: const LoginPage(),

    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showAboutSchool() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.workspace_premium, size: 50, color: Colors.blueAccent),
            SizedBox(height: 15),
            Text(" مدرسة التفوق", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              "مدرسة رائدة تسعى لتقديم تعليم نوعي متميز باستخدام أحدث الوسائل التقنية لبناء جيل مبدع",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showLocation() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(15),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.location_on, size: 50, color: Colors.red),
            SizedBox(height: 15),
            Text("موقع المدرسة", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("اليمن - تعز - بجانب جامعة تعز", textAlign: TextAlign.center),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showSupport() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("اتصل بنا - الدعم الفني", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("اتصال هاتفي"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.chat, color: Colors.blue),
              title: const Text("واتساب"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const Icon(Icons.school, size: 120, color: Color(0XFFFFD700)),
              const SizedBox(height: 25),
              const Text(
                "AL-Tafawuq Model School",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const Homepage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("الرجاء إدخال البريد وكلمة المرور")),
                      );
                    }
                  },
                  child: const Text("LOGIN", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium), label: 'عن المدرسة'),
          BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: 'موقع المدرسة'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_support_outlined), label: 'الدعم الفني'),
        ],
        onTap: (index) {
          if (index == 0) _showAboutSchool();
          if (index == 1) _showLocation();
          if (index == 2) _showSupport();
        },
      ),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("AL-Tafawuq Model School", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 190,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://tse3.mm.bing.net/th/id/OIP.BnhoRYGA3a-4mGQEVjXO-QHaGj?rs=1&pid=ImgDetMain&o=7&rm=3',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 50),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("AL-Tafawuq Model School", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  buildBox(context, "نتائج الطلاب", Icons.grading, Colors.blue),
                  buildBox(context, "الجدول الدراسي", Icons.calendar_month, Colors.orange),
                  buildBox(context, "أوائل الفصل", Icons.emoji_events, Colors.amber),
                  buildBox(context, "الرسوم الدراسية", Icons.payments, Colors.green),
                  buildBox(context, "الغياب والحضور", Icons.how_to_reg, Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Colors.purple),
              ),
              accountName: Text("Gawad Alsalahi"),
              accountEmail: Text("Student ID : 1234"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DataOnePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu),
              title: const Text('Operations'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DatatwoPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.blueAccent),
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBox(BuildContext context, String title, IconData icon, Color color) {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(title: title))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)],
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 45, color: color),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String title;
  const DetailsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
      ),
      body: _buildBodyContent(),
    );
  }

  Widget _buildBodyContent() {
    if (title == "الجدول الدراسي") {
      return _buildTimetable();
    } else if (title == "نتائج الطلاب") {
      return _buildResultsTable();
    } else {
      return Center(child: Text("محتوى صفحة $title سيتم إضافته قريباً"));
    }
  }

  Widget _buildTimetable() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Text("🗓 Weekly Class Timetable", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildRow(["Day", "Period 1", "Period 2", "Period 3"], isHeader: true),
            _buildRow(["Sun", "Math", "Physics", "English"]),
            _buildRow(["Mon", "Arabic", "Biology", "IT"]),
            _buildRow(["Tue", "Chemistry", "Math", "History"]),
            _buildRow(["Wed", "Physics", "English", "Sports"]),
            _buildRow(["Thu", "Biology", "Quran", "Art"]),
          ],
        ),
      ],
    );
  }

  Widget _buildResultsTable() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        const Text("📊 Academic Results", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Table(
          border: TableBorder.all(color: Colors.grey.shade300),
          children: [
            _buildRow(["Subject", "Score", "Grade"], isHeader: true),
            _buildRow(["Mathematics", "98", "A+"]),
            _buildRow(["Physics", "92", "A"]),
            _buildRow(["Computer Science", "100", "A+"]),
            _buildRow(["English Language", "85", "B+"]),
          ],
        ),
      ],
    );
  }

  TableRow _buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.blue.shade50 : Colors.white),
      children: cells
          .map((text) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
      ))
          .toList(),
    );
  }
}

class DataOnePage extends StatelessWidget {
  const DataOnePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Settings"), backgroundColor: Colors.purple, foregroundColor: Colors.white),
    body: const Center(child: Text("واجهة الإعدادات")),
  );
}

class DatatwoPage extends StatelessWidget {
  const DatatwoPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Operations"), backgroundColor: Colors.purple, foregroundColor: Colors.white),
    body: const Center(child: Text("واجهة العمليات")),
  );
}