import 'package:flutter/material.dart';
import 'package:proto/appoint.dart';
import 'package:proto/doctorpage.dart';

// Main Screen
class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  PageScreenState createState() => PageScreenState();
}

class PageScreenState extends State<PageScreen> {
  // تتبع الفهرس الحالي للـ BottomNavigationBar
  int _selectedIndex = 0;

  // دالة لتغيير الفهرس الحالي عند النقر
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // تحديث الفهرس المختار
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageScreen(), // فتح صفحة الأطباء
        ),
      );
    } else if (index == 1) {
      // إذا كان الزر المختار هو "Doctors" (الفهرس 1)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorsPage(), // فتح صفحة الأطباء
        ),
      );
    } else if (index == 2) {
      // إذا كان الزر المختار هو "Doctors" (الفهرس 1)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentPage(), // فتح صفحة الأطباء
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            text: 'Find Your ',
            style: TextStyle(color: Colors.black, fontSize: 22),
            children: [
              TextSpan(
                text: 'Specialist',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Doctor Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildDoctorInfo(
                        'Dr. Asma Khan',
                        'Medicine & Heart Specialist',
                        'Good Health Clinic',
                        'assets/images/Asma_Khan.png',
                      ),
                      buildDoctorInfo(
                        'Dr. Kiran Shakia',
                        'Dermatologist',
                        'Skin Care Clinic',
                        'assets/images/Dr. Kiran Shakia.png',
                      ),
                      buildDoctorInfo(
                        'Johir Raihan',
                        'Orthopedic',
                        'Bone Health Clinic',
                        'assets/images/Johir_Raihan.png',
                      ),
                      buildDoctorInfo(
                        'Salina Zaman',
                        'Pediatrician',
                        'Happy Kids Clinic',
                        'assets/images/Salina_Zaman.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategoryItem('Pediatrician', Icons.medical_services),
                  buildCategoryItem('Neurosurgeon', Icons.psychology),
                  buildCategoryItem('Cardiologist', Icons.favorite),
                  buildCategoryItem('Psychiatrist', Icons.medical_services),
                ],
              ),
            ),

            // Available Doctor Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Available Doctors',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),

            // Scrollable list of doctors
         Container(
  height: 200, // تحديد ارتفاع محدد لقائمة الأطباء لتجنب overflow
  margin: const EdgeInsets.all(10),
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
      GestureDetector(
        onTap: () {
          // استخدم الدالة لبناء تفاصيل الطبيب بدلاً من الانتقال إلى صفحة جديدة
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Dr Asma Khan"),
              content: buildDoctorInfo(
                "Dr Asma Khan",
                "Specialty Here",
                "Clinic Here",
                'assets/images/Asma_Khan.png',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  const Text("  Dr Asma Khan "),
                  SizedBox(height: 20),
                  Text("Experience 8 years"),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/Asma_Khan.png',
                height: 100,
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () {
          // استخدم الدالة لبناء تفاصيل الطبيب بدلاً من الانتقال إلى صفحة جديدة
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Dr. Kiran Shakia"),
              content: buildDoctorInfo(
                "Dr. Kiran Shakia",
                "Specialty Here",
                "Clinic Here",
                'assets/images/Dr. Kiran Shakia.png',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  const Text("  Dr. Kiran Shakia "),
                  SizedBox(height: 20),
                  Text("Experience 7 years"),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/Dr. Kiran Shakia.png',
                height: 70,
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () {
          // استخدم الدالة لبناء تفاصيل الطبيب بدلاً من الانتقال إلى صفحة جديدة
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Dr. Johir Raihan"),
              content: buildDoctorInfo(
                "Dr. Johir Raihan",
                "Specialty Here",
                "Clinic Here",
                'assets/images/Johir_Raihan.png',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          );
        },
        child: Container(
          height: 200,
          width: 200,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  const Text("  Dr. Johir Raihan "),
                  SizedBox(height: 20),
                  Text("Experience 7 years"),
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                'assets/images/Johir_Raihan.png',
                height: 70,
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 10),
    ],
  ),
),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // تتبع الزر المختار
        onTap: _onItemTapped, // استدعاء الدالة عند النقر على أي زر
        selectedItemColor: Colors.black, // لون الأيقونة المختارة
        unselectedItemColor: Colors.black, // لون الأيقونات غير المختارة
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Doctors', // أيقونة وصفحة الأطباء
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Function to build individual doctor information in horizontal list
  // Function to build individual doctor information in horizontal list
  Widget buildDoctorInfo(
      String name, String specialty, String clinic, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(
              name: name,
              specialty: specialty,
              clinic: clinic,
              imagePath: imagePath,
              experience: '5 Years', // Pass appropriate values
              patients: '1.08K', // Pass appropriate values
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                specialty,
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                clinic,
                style: const TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imagePath,
                  width: 100,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build a doctor card
  Widget buildDoctorCard(String name, String specialty, String experience,
      String patients, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetailPage(
              name: name,
              specialty: specialty,
              clinic: 'Clinic Name', // Provide the clinic name
              imagePath: imagePath,
              experience: experience,
              patients: patients,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              const SizedBox(height: 8),
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 4),
              Text(specialty, style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$experience Exp',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54)),
                  Text('$patients Patients',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build category items
  Widget buildCategoryItem(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[100],
            radius: 30,
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Doctor Detail Page
class DoctorDetailPage extends StatelessWidget {
  final String name;
  final String specialty;
  final String clinic;
  final String imagePath;
  final String experience;
  final String patients;

  const DoctorDetailPage({
    Key? key,
    required this.name,
    required this.specialty,
    required this.clinic,
    required this.imagePath,
    required this.experience,
    required this.patients,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Doctor Image
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(imagePath),
                backgroundColor: Colors.white,
              ),
            ),

            // Doctor Name and Specialty
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              specialty,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),

            // Clinic Information
            const SizedBox(height: 8),
            Text(
              clinic,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            const SizedBox(height: 20),

            // Ratings and Experience
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(Icons.people, color: Colors.blue),
                          const SizedBox(height: 4),
                          Text('$patients Patients'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          const SizedBox(height: 4),
                          Text('4.8 Rating'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(Icons.access_time, color: Colors.green),
                          const SizedBox(height: 4),
                          Text('$experience Experience'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons (Voice Call, Video Call, Message)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildActionButton(Icons.phone, "Voice Call", Colors.blue),
                  buildActionButton(
                      Icons.videocam, "Video Call", Colors.purple),
                  buildActionButton(Icons.message, "Message", Colors.orange),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // About Doctor Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "About Serena",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and "
                    "typesetting industry. Lorem Ipsum has been the industry's "
                    "standard dummy text ever since the 1500s.",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Book an Appointment Button
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Book appointment logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Book an Appointment",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Function to build action buttons
  Widget buildActionButton(IconData icon, String label, Color color) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: color, fontSize: 14),
        ),
      ],
    );
  }
}
