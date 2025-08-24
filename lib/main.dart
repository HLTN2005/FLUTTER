import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "My App QLNV",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            backgroundColor: Colors.blue,
          ),
          body: Interface(),
        ),
      ),
    );
  }
}

class NhanVien {
  final String SBD, hoTen, tuoi, loai, luongCoBan;

  NhanVien(this.SBD, this.hoTen, this.tuoi, this.loai, this.luongCoBan);
}

List<NhanVien> dsNhanVien = [];

class Interface extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Setting();
  }
}

class Setting extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton("Nhap thong tin nhan vien", context),
          _buildButton("In danh sach nhan vien", context),
          // _buildButton("Thuong nhan vien"),
          // _buildButton("Cham cong"),
          // _buildButton("Tong luong cua tat ca nhan vien"),
          // _buildButton("Loc nhan vien theo loai"),
          // _buildButton("Thoat"),
        ],
      ),
    );
  }
}

Widget _buildButton(String text, BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      if (text == "Nhap thong tin nhan vien") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NhapThongTin()),
        );
      } else if (text == "In danh sach nhan vien") {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DanhSachThongTinScreen()),
        );
      }
    },
    style: TextButton.styleFrom(
      foregroundColor: Colors.yellow,
      backgroundColor: Colors.purple,
      padding: EdgeInsets.all(10),
    ),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    ),
  );
}

class NhapThongTinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Nhap thong tin nhan vien"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          "Day la man hinh nhap thong tin nhan vien",
          style: TextStyle(
            backgroundColor: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}

class NhapThongTin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NhapThongTinState();
  }
}

class NhapThongTinState extends State<NhapThongTin> {
  final TextEditingController _SBD = TextEditingController();
  String? sbdError;
  final TextEditingController _hoTen = TextEditingController();
  final TextEditingController _tuoi = TextEditingController();
  final TextEditingController _loai = TextEditingController();
  final TextEditingController _luongCoBan = TextEditingController();

  void _themNhanVien() {
    final nv = NhanVien(
      _SBD.text,
      _hoTen.text,
      _tuoi.text,
      _loai.text,
      _luongCoBan.text,
    );
    String sbd=_SBD.text.trim();
    if (sbdError != null || sbd.isEmpty) return;
    setState(() {
      dsNhanVien.add(nv);
      dsNhanVien.sort((a,b)=>a.SBD.compareTo(b.SBD));
    });
    _SBD.clear();
    _hoTen.clear();
    _tuoi.clear();
    _loai.clear();
    _luongCoBan.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Da nhap\n SBD: ${nv.SBD} \n"
          "Ho ten: ${nv.hoTen} \n"
          "Tuoi: ${nv.tuoi} \n"
          "Loai: ${nv.loai} \n"
          "Luong co ban: ${nv.luongCoBan}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Nhap thong tin nhan vien"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _SBD,
              decoration: InputDecoration(
                labelText: "SBD",
                border: OutlineInputBorder(),
                errorText: sbdError,
              ),
              onChanged: (value) {
                setState(() {
                  if (dsNhanVien.any((nv) => nv.SBD == value.trim())) {
                    sbdError = "SBD da ton tai";
                  } else {
                    sbdError = null;
                  }
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              controller: _hoTen,
              decoration: InputDecoration(
                labelText: "Ho ten",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _tuoi,
              decoration: InputDecoration(
                labelText: "Tuoi",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _loai,
              decoration: InputDecoration(
                labelText: "Loai",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _luongCoBan,
              decoration: InputDecoration(
                labelText: "Luong co ban",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _themNhanVien,
              child: Text("Them nhan vien"),
            ),
          ],
        ),
      ),
    );
  }
}

class DanhSachThongTinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh sach nhan vien"),
        backgroundColor: Colors.blue,
      ),
      body: dsNhanVien.isEmpty
          ? Center(child: Text("Danh sach nhan vien trong"))
          : ListView.builder(
              itemCount: dsNhanVien.length,
              itemBuilder: (BuildContext context, int index) {
                final nv = dsNhanVien[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(child: Text(nv.SBD)),
                    title: Text(nv.hoTen),
                    subtitle: Text(
                      "| Tuoi: ${nv.tuoi} | Loai: ${nv.loai} | Luong co ban: ${nv.luongCoBan} |",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
