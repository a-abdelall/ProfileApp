import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        
      ),
      home: const ProfileScreen(),
    );
  }
}
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  Header Section 
            _buildHeader(),
            const SizedBox(height: 24),
            //  Info Cards 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Contact Information'),
                  const SizedBox(height: 12),
                  _buildInfoCard([
                    _InfoItem(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: 'ahmed.mohamed@example.com',
                    ),
                    _InfoItem(
                      icon: Icons.phone_outlined,
                      label: 'Phone',
                      value: '+20 100 123 4567',
                    ),
                    _InfoItem(
                      icon: Icons.location_on_outlined,
                      label: 'Address',
                      value: 'Cairo, Egypt',
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Additional Information'),
                  const SizedBox(height: 12),
                  _buildInfoCard([
                    _InfoItem(
                      icon: Icons.work_outline,
                      label: 'Job Title',
                      value: 'Mobile Developer',
                    ),
                    _InfoItem(
                      icon: Icons.cake_outlined,
                      label: 'Date of Birth',
                      value: 'January 1, 2000',
                    ),
                  ]),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Bio'),
                  const SizedBox(height: 12),
                  _buildBioCard(),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //  Header with Avatar 
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1565C0), Color(0xFF1976D2), Color(0xFF42A5F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 36),
          child: Column(
            children: [
              // Avatar
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 52,
                  backgroundColor: Color(0xFFBBDEFB),
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Color(0xFF1565C0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Name
              const Text(
                'Ahmed Mohamed',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 6),
              // Job badge
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white38),
                ),
                child: const Text(
                  'Mobile Developer',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  Section Title 
  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 20,
          decoration: BoxDecoration(
            color: const Color(0xFF1976D2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A2A40),
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  // Info Card 
  Widget _buildInfoCard(List<_InfoItem> items) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: items.map((item) {
            final isLast = item == items.last;
            return Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(item.icon,
                        color: const Color(0xFF1976D2), size: 22),
                  ),
                  title: Text(
                    item.label,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF90A4AE),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    item.value,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF1A2A40),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                if (!isLast)
                  const Divider(
                      height: 1, indent: 70, endIndent: 20, thickness: 0.8),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  // Bio Card 
  Widget _buildBioCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.format_quote,
                  color: Color(0xFF1976D2), size: 22),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Passionate Flutter Developer',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF546E7A),
                  height: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ── Data Model ──
class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}