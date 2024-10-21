import 'package:flutter/material.dart';
import 'package:proto/Welcome.dart';
import 'package:proto/appoint.dart';

class Doctor {
  final String name;       // اسم الطبيب
  final String specialty;  // تخصص الطبيب
  final String experience; // عدد سنوات الخبرة
  final String patients;   // عدد المرضى الذين تم علاجهم
  final String imagePath;  // مسار صورة الطبيب

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.patients,
    required this.imagePath,
  });
}

List<Doctor> doctors = [
  Doctor(
    name: 'Dr. Asma Khan',
    specialty: 'Dermatologist',
    experience: '8 Years',
    patients: '1.5K',
    imagePath: 'assets/images/Asma_Khan.png',
  ),
  Doctor(
    name: 'Dr. Jouner Shaki',
    specialty: 'Medicine Specialist',
    experience: '5 Years',
    patients: '2.7K',
    imagePath: 'assets/images/Johir_Raihan.png',
  ),
  Doctor(
    name: 'Dr. Kiran Shakia',
    specialty: 'Dermatologist',
    experience: '8 Years',
    patients: '1.5K',
    imagePath: 'assets/images/Dr. Kiran Shakia.png',
  ),
  Doctor(
    name: 'Johir Raihan',
    specialty: 'Orthopedic',
    experience: '6 Years',
    patients: '1.5K',
    imagePath: 'assets/images/Johir_Raihan.png',
  ),
  Doctor(
    name: 'Salina Zaman',
    specialty: 'Pediatrician',
    experience: '7 Years',
    patients: '2.1K',
    imagePath: 'assets/images/Salina_Zaman.png',
  ),
  // يمكنك إضافة المزيد من الأطباء هنا
];

class DoctorsPage extends StatefulWidget {
  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  // تتبع الفهرس الحالي للـ BottomNavigationBar
  int selectedIndex = 0;

  // دالة لتغيير الفهرس الحالي عند النقر
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;  // تحديث الفهرس المختار
    });

    if (index == 1) {  // إذا كان الزر المختار هو "Doctors" (الفهرس 1)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorsPage(),  // فتح صفحة الأطباء
        ),
      );
    }
    else if(index == 0){
        Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageScreen(),  // فتح صفحة الأطباء
        ),
      );
    }
    else if (index == 2) {  // إذا كان الزر المختار هو "Doctors" (الفهرس 1)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppointmentPage(),  // فتح صفحة الأطباء
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Specialists'),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: doctors.length, // يتم استخدام جميع الأطباء
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(doctor.imagePath),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(doctor.specialty),
                    const SizedBox(height: 5),
                    Text('Experience: ${doctor.experience}'),
                    const SizedBox(height: 5),
                    Text('Patients: ${doctor.patients}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
         bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,  // تتبع الزر المختار
        onTap: _onItemTapped,  // استدعاء الدالة عند النقر على أي زر
        selectedItemColor: Colors.black,  // لون الأيقونة المختارة
        unselectedItemColor: Colors.black,  // لون الأيقونات غير المختارة
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Doctors',  // أيقونة وصفحة الأطباء
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
}


