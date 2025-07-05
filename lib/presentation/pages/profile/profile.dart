import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'controller/profile_controller.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  String deviceInfo = 'Unknown';

  @override
  void initState() {
    super.initState();
    final profile = ref.read(profileProvider);
    if (profile != null) {
      _nameController.text = '${profile.firstName} ${profile.lastName}';
      _emailController.text = profile.email;
    }
  }

Future<void> _getDeviceInfo() async {
  const platform = MethodChannel('tezda/device_info');
  try {
    final result = await platform.invokeMethod<String>('getDeviceInfo');
    setState(() {
      deviceInfo = result ?? 'Unknown';
    });
  } catch (e) {
    setState(() {
      deviceInfo = 'Failed to get device info: $e';
    });
  }
}

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);

    if (profile == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundImage: profile.image.isNotEmpty
                  ? NetworkImage(profile.image)
                  : null,
              child: profile.image.isEmpty
                  ? const Icon(Icons.person, size: 48)
                  : null,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Name'),
            onChanged: notifier.updateName,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            onChanged: notifier.updateEmail,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _getDeviceInfo,
            child: const Text('Get Device Info'),
          ),
          const SizedBox(height: 12),
          Text('Device Info: $deviceInfo'),
        ],
      ),
    );
  }
}
