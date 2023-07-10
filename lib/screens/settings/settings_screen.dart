import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 22, right: 16),
        child: Column(
            children: [
              settingBuilder(Icons.person, 'Meu perfil'),
              settingBuilder(Icons.offline_share_outlined, 'Ouvir offline'),
              settingBuilder(Icons.equalizer, 'Equalizador'),
              settingBuilder(Icons.help_outline, 'Ajuda'),
              settingBuilder(Icons.chat_bubble_outline_outlined, 'Atendimento ao cliente'),
            ]
        )
      ),
    );
  }
  Widget settingBuilder(IconData icon, String title){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          ContainerPlus(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 35,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 8,),
                    TextPlus(
                      title,
                      fontSize: 18,
                      color: Colors.white,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 12,),
          const Divider(color: Colors.white, height: 1,),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}
