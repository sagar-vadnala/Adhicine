
import 'package:adhicine/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            SizedBox(height: 20),
            SettingsSection(),
            SizedBox(height: 20),
            DeviceSection(),
            SizedBox(height: 20),
            CaretakersSection(),
            SizedBox(height: 20),
            DoctorSection(),
            SizedBox(height: 20),
            OtherOptions(),
            SizedBox(height: 20),
            MyButton(text: "Log Out",)
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage('assets/adhicine.png'), // Add your profile picture asset here
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Take Care!',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              'Richa Bose',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Settings",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),
        ),
        SizedBox(height: 20,),
        SettingItem(
          icon: Icons.notifications_none,
          title: 'Notification',
          subtitle: 'Check your medicine notification',
        ),
        SizedBox(height: 20,),
        SettingItem(
          icon: Icons.volume_up,
          title: 'Sound',
          subtitle: 'Ring, Silent, Vibrate',
        ),
        SizedBox(height: 20,),
        SettingItem(
          icon: Icons.person,
          title: 'Manage Your Account',
          subtitle: 'Password, Email ID, Phone Number',
        ),
        SizedBox(height: 20,),
        SettingItem(
          icon: Icons.notifications_none,
          title: 'Notification',
          subtitle: 'Check your medicine notification',
        ),
        SizedBox(height: 20,),
        SettingItem(
          icon: Icons.notifications_none,
          title: 'Notification',
          subtitle: 'Check your medicine notification',
        ),
      ],
    );
  }
}

class DeviceSection extends StatelessWidget {
  const DeviceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Device', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SettingItem(
                icon: Icons.bluetooth,
                title: 'Connect',
                subtitle: 'Bluetooth, Wi-Fi',
                isNested: true,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(color: Colors.black)
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10,left: 5,right: 5),
                  child: SettingItem(
                    icon: Icons.volume_up,
                    title: 'Sound Option',
                    subtitle: 'Ring, Silent, Vibrate',
                    isNested: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CaretakersSection extends StatelessWidget {
  const CaretakersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Caretakers: 03', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CaretakerAvatar(name: 'Dipa Luna'),
              CaretakerAvatar(name: 'Roz Sod.'),
              CaretakerAvatar(name: 'Sunny Tu.'),
              AddCaretakerButton(),
            ],
          ),
        ),
      ],
    );
  }
}

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Device', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10,),
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [
              Icon(Icons.add_circle, size: 40, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Add Your Doctor',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or use  ',
                    style: TextStyle(color: Colors.orange),
                  ),
                  Text(
                    'invite link',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtherOptionItem(title: 'Privacy Policy'),
        OtherOptionItem(title: 'Terms of Use'),
        OtherOptionItem(title: 'Rate Us'),
        OtherOptionItem(title: 'Share'),
      ],
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isNested;

  const SettingItem({super.key, 
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isNested = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(subtitle, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const Spacer(),
        if (isNested) const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }
}

class CaretakerAvatar extends StatelessWidget {
  final String name;

  const CaretakerAvatar({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/adhicine.png'), // Add your caretaker picture asset here
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class AddCaretakerButton extends StatelessWidget {
  const AddCaretakerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
            child: const Icon(Icons.add, color: Colors.white),
          ),
          const SizedBox(height: 5),
          const Text(
            'Add',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class OtherOptionItem extends StatelessWidget {
  final String title;

  const OtherOptionItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black,
        fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}