import 'package:flutter/material.dart';
import 'package:latihan_quiz/components/custom_button.dart';
import 'package:latihan_quiz/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String namaPanggilan;

  const HomePage({super.key, required this.username, required this.namaPanggilan});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController pengalamanKerjaController = TextEditingController();
  final TextEditingController pengalamanOrganisasiController = TextEditingController();
  final TextEditingController hardSkillController = TextEditingController();
  final TextEditingController softSkillController = TextEditingController();
  final TextEditingController pencapaianController = TextEditingController();

  void _navigateToProfile() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(
            namaLengkap: namaLengkapController.text,
            nim: nimController.text,
            pengalamanKerja: pengalamanKerjaController.text,
            pengalamanOrganisasi: pengalamanOrganisasiController.text,
            hardSkill: hardSkillController.text,
            softSkill: softSkillController.text,
            pencapaian: pencapaianController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String greeting = "Selamat Datang ${widget.namaPanggilan.isNotEmpty ? widget.namaPanggilan : widget.username}";

    return Scaffold(
      appBar: AppBar(
        title: Text(greeting),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Lengkapi Data CV Anda",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildFormField(
                    controller: namaLengkapController,
                    label: "Nama Lengkap",
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: nimController,
                    label: "NIM",
                    icon: Icons.numbers,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'NIM tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: pengalamanKerjaController,
                    label: "Pengalaman Kerja",
                    icon: Icons.work,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: pengalamanOrganisasiController,
                    label: "Pengalaman Organisasi",
                    icon: Icons.groups,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: hardSkillController,
                    label: "Hard Skill",
                    icon: Icons.laptop_mac,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: softSkillController,
                    label: "Soft Skill",
                    icon: Icons.psychology,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  _buildFormField(
                    controller: pencapaianController,
                    label: "Pencapaian/Penghargaan",
                    icon: Icons.emoji_events,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: CustomButton(
                      onPressed: _navigateToProfile,
                      text: "Lihat Profil",
                      icon: Icons.person_search,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}