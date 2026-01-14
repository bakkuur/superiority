import 'package:flutter/material.dart';

class StudentResultsPage extends StatelessWidget {
  const StudentResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نتائج الطلاب"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text("📊 نتائج الفصل الدراسي الأول", textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          Table(
            border: TableBorder.all(color: Colors.grey.shade300),
            children: [
              _buildRow(["المادة", "الدرجة", "التقدير"], isHeader: true),
              _buildRow(["الرياضيات", "98", "ممتاز"]),
              _buildRow(["الفيزياء", "92", "جيد جداً"]),
              _buildRow(["علوم الحاسوب", "100", "ممتاز"]),
              _buildRow(["اللغة الإنجليزية", "85", "جيد"]),
              _buildRow(["اللغة العربية", "90", "جيد جداً"]),
            ],
          ),
          const SizedBox(height: 20),
          const Text("ملاحظات: هذه النتائج تقديرية وقد تختلف عن النتائج النهائية.", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  TableRow _buildRow(List<String> cells, {bool isHeader = false}) {
    return TableRow(
      decoration: BoxDecoration(color: isHeader ? Colors.blue.shade50 : Colors.white),
      children: cells
          .map((text) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(text, textAlign: TextAlign.center, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal, fontSize: 15)),
      ))
          .toList(),
    );
  }
}
