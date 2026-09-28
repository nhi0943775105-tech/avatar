import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', 
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
      // Màu nền ngoài cùng tối hơn một chút để làm nổi bật khung 390px
      backgroundColor: Colors.grey.shade300, 
      body: Center( // Căn giữa khung màn hình
        child: Container(
          width: 390, // Width: Fixed (390px) chuẩn theo Figma
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC), // Màu nền của App
            borderRadius: BorderRadius.circular(44), // Radius: 44px
            border: Border.all(
              color: Colors.grey.shade400, // Màu viền (tùy chọn)
              width: 3, // Border: 3px
            ),
          ),
          child: ClipRRect(
            // Bo góc nội dung bên trong để khi cuộn không bị tràn ra ngoài viền 44px
            borderRadius: BorderRadius.circular(41), 
            child: SingleChildScrollView(
              child: Padding(
                // Căn lề chuẩn xác: Top 44, Right 24, Bottom 36, Left 24
                padding: const EdgeInsets.only(
                  top: 44.0, 
                  right: 24.0, 
                  bottom: 36.0, 
                  left: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildAvatarSection(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildStatsBoard(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildAboutMeSection(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildSkillsSection(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildProjectsSection(),
                    const SizedBox(height: 24), // Gap: 24px

                    _buildContactInfo(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  /// 1. Header (Nút Back, Tiêu đề, Nút Share)
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Nút Back
        Container(
          height: 42, 
          alignment: Alignment.center, 
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), 
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFE2E8F0), 
              width: 1, 
            ),
          ),
          child: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF0F172A)),
        ),
        
        // Tiêu đề
        const Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 18, 
            fontWeight: FontWeight.w700, 
            height: 1.0, 
            color: Color(0xFF0F172A), 
          ),
        ),

        // Nút Share
        Container(
          height: 42, 
          alignment: Alignment.center, 
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF), 
            borderRadius: BorderRadius.circular(12), 
            border: Border.all(
              color: const Color(0xFFE2E8F0), 
              width: 1, 
            ),
          ),
          child: const Icon(Icons.share_outlined, size: 20, color: Color(0xFF0F172A)),
        ),
      ],
    );
  }

  // 2. Avatar & Thông tin cá nhân
  Widget _buildAvatarSection() {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                width: 140, 
                height: 140,
                alignment: Alignment.center, 
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [Color(0xFFFFB087), Color(0xFFFF8080), Color(0xFFFFCF70)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Container(
                  width: 132,
                  height: 132,
                  alignment: Alignment.center, 
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: SizedBox(
                    width: 124,
                    height: 124,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage('images/avatar.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 4, 
                right: 4, 
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0EA5E9),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3), // Viền trắng của tick
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8), 
          
          const Text(
            'Alex Rivers',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 24, 
              fontWeight: FontWeight.w700, 
              height: 1.0, 
              color: Color(0xFF0F172A), 
            ),
          ),
          const SizedBox(height: 8), 
          
          const Text(
            'Lead Mobile Engineer',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15, 
              fontWeight: FontWeight.w500, 
              height: 1.0, 
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 8), // Khoảng cách tới Nút Location
          
          Container(
            padding: const EdgeInsets.only(top: 6, right: 14, bottom: 6, left: 14), 
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFE2E8F0), 
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(
                  Icons.location_on_outlined, 
                  size: 14, 
                  color: Color(0xFF475569)
                ),
                SizedBox(width: 6), 
                Text(
                  'Tokyo, Japan',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13, 
                    fontWeight: FontWeight.w600, 
                    height: 1.0, 
                    color: Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Khối Thống kê
  Widget _buildStatsBoard() {
    return Container(
      width: double.infinity, 
      height: 78, 
      padding: const EdgeInsets.only(
        top: 18.0,
        right: 20.0,
        bottom: 18.0,
        left: 20.0,
      ), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), 
        border: Border.all(
          color: const Color(0xFFE2E8F0), 
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          _statItem('148', 'Projects', const Color(0xFF0F172A)),
          Container(width: 1, height: 42, color: const Color(0xFFE2E8F0)), 
          _statItem('9 Yrs', 'Experience', const Color(0xFF0F172A)),
          Container(width: 1, height: 42, color: const Color(0xFFE2E8F0)),
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Row(
                children: const [
                  Text(
                    '4.9', 
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20, 
                      fontWeight: FontWeight.w700, 
                      height: 1.0, 
                      color: Color(0xFFEAB308), 
                    )
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.star, color: Color(0xFFEAB308), size: 20),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Rating', 
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12, 
                  fontWeight: FontWeight.w500, 
                  height: 1.0, 
                  color: Color(0xFF94A3B8), 
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, Color valueColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [
        Text(
          value, 
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20, 
            fontWeight: FontWeight.w700, 
            height: 1.0, 
            color: valueColor,
          )
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 12, 
            fontWeight: FontWeight.w500, 
            height: 1.0, 
            color: Color(0xFF94A3B8),
          )
        ),
      ],
    );
  }

  // 4. About Me
  Widget _buildAboutMeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'About Me',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        SizedBox(height: 8), // Gap nội bộ nhỏ
        Text(
          'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant',
          style: TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.5),
        ),
      ],
    );
  }

  // 5. Skills
  Widget _buildSkillsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Skills & Expertise',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        const SizedBox(height: 12), // Gap nội bộ nhỏ
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _skillChip('Flutter', Icons.design_services, const Color(0xFFE0F2FE), const Color(0xFF0369A1)),
            _skillChip('Dart', Icons.code, const Color(0xFFDCFCE7), const Color(0xFF15803D)),
            _skillChip('Clean Arch', Icons.layers, const Color(0xFFFFE4E6), const Color(0xFFBE123C)),
            _skillChip('UI/UX', Icons.format_shapes, const Color(0xFFF3E8FF), const Color(0xFF7E22CE)),
            _skillChip('Firebase', Icons.local_fire_department, const Color(0xFFFEF3C7), const Color(0xFFB45309)),
          ],
        ),
      ],
    );
  }

  Widget _skillChip(String text, IconData icon, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // 6. Featured Projects
  Widget _buildProjectsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Featured Projects',
          style: TextStyle(
            fontFamily: 'Inter', 
            fontSize: 18, 
            fontWeight: FontWeight.bold, 
            color: Color(0xFF1E293B)
          ),
        ),
        const SizedBox(height: 12), 
        Row(
          children: [
            
            Expanded(
              child: _projectCard('images/nenxam.png', 'E-Shop Flutter', 'Mobile App • 2026'),
            ),
            const SizedBox(width: 12), // Khoảng cách 12px giữa 2 thẻ
            Expanded(
              child: _projectCard('images/nentim.png', 'Crypto Vault', 'Finance • Clean Arch'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _projectCard(String imagePath, String title, String subtitle) {
    return Container(
      height: 145, // Chiều cao cố định của thẻ là 145px
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Bo góc 16px
        border: Border.all(
          color: const Color(0xFFE2E8F0), // Đổi sang màu viền xám nhạt chuẩn
          width: 1, // Viền 1px
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 85, // Chiều cao của ảnh thu lại thành 85px
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13, // Cỡ chữ 13px
                    fontWeight: FontWeight.w700, // Độ dày 700 (Bold)
                    height: 1.0, // Line height 100%
                    color: Color(0xFF0F172A),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6), // Khoảng cách nhỏ giữa tiêu đề và phụ đề
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11, // Cỡ chữ 11px
                    fontWeight: FontWeight.w500, // Độ dày 500 (Medium)
                    height: 1.0, // Line height 100%
                    color: Color(0xFF64748B), // Màu #64748B
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  // 7. Contact Information
  Widget _buildContactInfo() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          _contactItem(Icons.alternate_email, 'Contact Information', isBold: true),
          const Divider(height: 1, thickness: 1),
          _contactItem(Icons.mail_outline, 'alex.rivers@email.com'),
          const Divider(height: 1, thickness: 1),
          _contactItem(Icons.phone_outlined, '+81 (90) 1234-5678'),
        ],
      ),
    );
  }

  Widget _contactItem(IconData icon, String text, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                color: isBold ? Colors.black : Colors.grey.shade800,
              ),
            ),
          ),
          const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        ],
      ),
    );
  }
}