import 'package:flutter/material.dart';

class InstagramProfile extends StatelessWidget {
  const InstagramProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        title: const Row(
          children: [
            Text(
              'sanath.draws',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.black),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_box_outlined, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),

      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture and statistics
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      // Story ring around avatar
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFBAA47),
                              Color(0xFFD91A46),
                              Color(0xFFA60F93),
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/profile.jpg',
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      const Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _ProfileStat(
                              count: '24',
                              label: 'Posts',
                            ),
                            _ProfileStat(
                              count: '1.2K',
                              label: 'Followers',
                            ),
                            _ProfileStat(
                              count: '350',
                              label: 'Following',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Name and bio
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sanath Sreekumar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        '🎨 Artist | 📱 Flutter Developer',
                        style: TextStyle(fontSize: 13.5, height: 1.3),
                      ),
                      Text(
                        'Drawing my ideas into reality ✨',
                        style: TextStyle(fontSize: 13.5, height: 1.3),
                      ),
                      Text(
                        '📍 Kerala, India',
                        style: TextStyle(fontSize: 13.5, height: 1.3),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                // Action buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 34,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Edit Profile tapped'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEFEFEF),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: SizedBox(
                          height: 34,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Share Profile tapped'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEFEFEF),
                              foregroundColor: Colors.black,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Share Profile',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 36,
                        height: 34,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEFEFEF),
                            foregroundColor: Colors.black,
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Icon(Icons.person_add_outlined, size: 18),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Story highlights
                SizedBox(
                  height: 96,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: const [
                      _StoryHighlight(
                        title: 'New',
                        icon: Icons.add,
                        isAdd: true,
                      ),
                      _StoryHighlight(
                        title: 'Art',
                        icon: Icons.brush_outlined,
                      ),
                      _StoryHighlight(
                        title: 'Life',
                        icon: Icons.landscape_outlined,
                      ),
                      _StoryHighlight(
                        title: 'Projects',
                        icon: Icons.code_outlined,
                      ),
                      _StoryHighlight(
                        title: 'Friends',
                        icon: Icons.people_outline,
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1, thickness: 0.5),

                // Posts tab bar
                const SizedBox(
                  height: 44,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.grid_on, size: 22, color: Colors.black),
                            SizedBox(height: 4),
                            // Selected indicator line
                            SizedBox(
                              height: 1.5,
                              width: double.infinity,
                              child: ColoredBox(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.video_library_outlined,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                      Expanded(
                        child: Icon(
                          Icons.person_pin_outlined,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // Post image grid
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1.5,
                    mainAxisSpacing: 1.5,
                  ),
                  itemBuilder: (context, index) {
                    final imageNumber = index + 1;

                    return Image.network(
                      'https://picsum.photos/seed/instagram$imageNumber/300/300',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color(0xFFF0F2F5),
                          child: const Icon(
                            Icons.image_outlined,
                            size: 30,
                            color: Colors.grey,
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Profile statistics widget
class _ProfileStat extends StatelessWidget {
  final String count;
  final String label;

  const _ProfileStat({
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Story highlight widget
class _StoryHighlight extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isAdd;

  const _StoryHighlight({
    required this.title,
    required this.icon,
    this.isAdd = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isAdd ? const Color(0xFFDBDBDB) : const Color(0xFFDBDBDB),
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: const Color(0xFFFAFAFA),
                child: Icon(
                  icon,
                  color: Colors.black87,
                  size: 24,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}