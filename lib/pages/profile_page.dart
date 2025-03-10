import 'package:flutter/material.dart';
import 'package:latihan_quiz/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  final String namaLengkap;
  final String nim;
  final String pengalamanKerja;
  final String pengalamanOrganisasi;
  final String hardSkill;
  final String softSkill;
  final String pencapaian;

  const ProfilePage({
    super.key,
    required this.namaLengkap,
    required this.nim,
    required this.pengalamanKerja,
    required this.pengalamanOrganisasi,
    required this.hardSkill,
    required this.softSkill,
    required this.pencapaian,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil CV"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade100, Colors.white],
            stops: const [0.0, 0.3],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Foto profil
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.indigo.shade300,
                  child: const CircleAvatar(
                    radius: 67,
                    backgroundImage: AssetImage('assets/img/person.jpeg'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  namaLengkap,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  nim,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 30),
                // Selalu menampilkan semua card bahkan jika data kosong
                _buildProfileCard("Pengalaman Kerja", pengalamanKerja, Icons.work),
                _buildProfileCard("Pengalaman Organisasi", pengalamanOrganisasi, Icons.groups),
                _buildProfileCard("Hard Skill", hardSkill, Icons.laptop_mac),
                _buildProfileCard("Soft Skill", softSkill, Icons.psychology),
                _buildProfileCard("Pencapaian/Penghargaan", pencapaian, Icons.emoji_events),
                const SizedBox(height: 30),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Logout"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard(String title, String content, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Text(
                // Jika content kosong, tampilkan pesan default
                content.isNotEmpty ? content : "Belum ada data",
                style: TextStyle(
                  fontSize: 16,
                  color: content.isNotEmpty ? Colors.black87 : Colors.grey.shade400,
                  fontStyle: content.isNotEmpty ? FontStyle.normal : FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}