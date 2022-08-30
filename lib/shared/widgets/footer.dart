import 'package:encaixe_app/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../themes/app_text_style.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    int _index = 1;
    return NavigationBar(
      destinations: [
        Column(
          children: [
            _index == 0
                ? const Icon(Icons.search, color: Colors.orange)
                : const Icon(Icons.search_outlined),
            const Text('Encaixar'),
          ],
        ),
        Column(
          children: [
            _index == 0
                ? const Icon(Icons.add_rounded, color: Colors.orange)
                : const Icon(Icons.add_circle_rounded),
            const Text('Adicionar'),
          ],
        ),
        Column(
          children: [
            _index == 0
                ? const Icon(Icons.person_search, color: Colors.orange)
                : const Icon(Icons.person_search_outlined),
            const Text('Clientes'),
          ],
        ),
      ],
      selectedIndex: _index,
      
      onDestinationSelected: (value) {
        setState(() {
          _index = value;
        });
        switch (value) {
          case 0:
            Navigator.pushReplacementNamed(context, '/search');

            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/register');

            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/get_all');

            break;
        }
      },
    );
  }
}


// SizedBox(
//       height: 45,
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5), color: AppColors.white),
//         padding: const EdgeInsets.all(5),
//         child: Row(
//           children: [
//             Text('Gerenciador de encaixes', style: AppTextStyle.titleFooter)
//           ],
//         ),
//       ),
//     );