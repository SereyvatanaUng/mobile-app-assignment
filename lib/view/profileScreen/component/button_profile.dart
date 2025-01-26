// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../theme/theme_provioder.dart';
//
// class ButtonProfile extends StatefulWidget {
//   const ButtonProfile({super.key});
//
//   @override
//   State<ButtonProfile> createState() => _ButtonProfileState();
// }
//
// class _ButtonProfileState extends State<ButtonProfile> {
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final themeLogic = Provider.of<ThemeLogic>(context);
//     final List<Map<String, String>> profiles = [
//       {
//         'name': 'Your Story',
//         'imageUrl':
//         'https://i.pinimg.com/736x/41/49/3f/41493f14c62a532266f742584736e876.jpg'
//       },
//       {
//         'name': 'John Doe',
//         'imageUrl': 'https://i.pinimg.com/736x/fa/8b/e4/fa8be41486f9cbb1d3626aeac68d8ce5.jpg'
//       },
//       {
//         'name': 'Jane Smith',
//         'imageUrl': 'https://i.pinimg.com/736x/d8/6e/97/d86e974acb88a2c14bf6402f176c2cc6.jpg'
//       },
//       {
//         'name': 'Your Story',
//         'imageUrl':
//         'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
//       },
//       {
//         'name': 'John Doe',
//         'imageUrl': 'https://i.pinimg.com/736x/3b/31/d4/3b31d4d5c173381a248b037be2208249.jpg'
//       },
//       {
//         'name': 'Jane Smith',
//         'imageUrl': 'https://i.pinimg.com/736x/87/7f/da/877fda4259fcaddb8833fe8775f83035.jpg'
//       },
//       {
//         'name': 'Your Story',
//         'imageUrl':
//         'https://i.pinimg.com/736x/16/0e/d9/160ed9b1029d84c00b761c7f30ebba5c.jpg'
//       },
//       {
//         'name': 'John Doe',
//         'imageUrl': 'https://i.pinimg.com/736x/ac/96/a8/ac96a85fa256de2f832a3641765b0d56.jpg'
//       },
//       {
//         'name': 'Jane Smith',
//         'imageUrl': 'https://i.pinimg.com/736x/33/8f/e6/338fe651e97c686dd08aec020502ec2e.jpg'
//       },
//       // Add more profiles as needed
//     ];
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                     theme.appBarTheme.backgroundColor ?? theme.primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                   ),
//                   child: Text(
//                     'Edit profile',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: theme.appBarTheme.foregroundColor ??
//                           theme.colorScheme.onPrimary,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                     theme.appBarTheme.backgroundColor ?? theme.primaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                   ),
//                   child: Text(
//                     'Share profile',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: theme.appBarTheme.foregroundColor ??
//                           theme.colorScheme.onPrimary,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 16),
//           Column(
//             children: [
//               Container(
//                 height: 70,
//                 width: 70,
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey.shade300,
//                   ),
//                   borderRadius: BorderRadius.circular(84),
//                 ),
//                 child: ClipOval(
//                   child: Image.network(
//                     'https://i.pinimg.com/736x/56/67/93/5667936906181a6fbe0501b471e2b5bd.jpg',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               const Text(
//                 'Code',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provioder.dart';

class ButtonProfile extends StatefulWidget {
  const ButtonProfile({super.key});

  @override
  State<ButtonProfile> createState() => _ButtonProfileState();
}

class _ButtonProfileState extends State<ButtonProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);
    final List<Map<String, String>> profiles = [
      {
        'name': 'Me',
        'imageUrl':
        'https://scontent.fpnh5-6.fna.fbcdn.net/v/t39.30808-6/470672122_1117067573513336_4057489276232374917_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=103&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeFeL42FpshM9UtG_mROpqDN524fthKPBh7nbh-2Eo8GHsLFuCps1B_Mxz5gAiGAXGY9FX6En337PNfQ9w1UVHlv&_nc_ohc=4dptcejJRloQ7kNvgFZva-j&_nc_oc=AdgIXHPRZRfvJ05NRH07qZk4sV8OuyIjmEB6r_708vt4xyjbVFG3ROFRpmvS587R0Os&_nc_zt=23&_nc_ht=scontent.fpnh5-6.fna&_nc_gid=ArLIOsD__lkBsDKj7z7p1Eo&oh=00_AYBsFD1yaZwrPnDq3kasDIM-Reyan9xq2NFMJcYI-yxF3A&oe=679C3856'
      },
      {
        'name': 'Code',
        'imageUrl': 'https://i.pinimg.com/736x/56/67/93/5667936906181a6fbe0501b471e2b5bd.jpg'
      },
      {
        'name': 'Party',
        'imageUrl': 'https://scontent.fpnh5-1.fna.fbcdn.net/v/t39.30808-6/401660582_847285427158220_2828673937011013773_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGqtgnKee8ERz2Nkhs8dRZJYA6b1Txy6l1gDpvVPHLqXWZ_4HxqmFjQa2YcWCWmgCm5ngvgTFYbIiL4JPpoEJYg&_nc_ohc=XS53VuxaRRcQ7kNvgF7SsGc&_nc_oc=AdizxWA0bMn7x1r0zb6bj_Y5_Y2ZwK8esRO9TNVgAKzoHuuctvtpETJfu8FBiVk2y3Q&_nc_zt=23&_nc_ht=scontent.fpnh5-1.fna&_nc_gid=AEx7aE47kzGwLMcQUICDH8p&oh=00_AYDOkI__SUamJ9vzesVMIlIcr_Zu5CfoZOizTvsm3fPaAw&oe=679C47A3'
      },
      {
        'name': 'Cute',
        'imageUrl':
        'https://scontent.fpnh5-4.fna.fbcdn.net/v/t39.30808-6/399471222_843853957501367_9108087213932572951_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeGcgeaEwIaqLbCtt64jyI0R0p_vpC84Y8HSn--kLzhjwRusxBU5kMx-pzAQni02Kxv4L2qneYfaB-tmTaHlskXl&_nc_ohc=bREb3cYwqSIQ7kNvgGG_-6o&_nc_oc=AdhrxitntBsgcpAu7rGqlhN6_teGFr2OuD1jDEJR7iYjpDJPWVsWVAdhefEd8gNuEYc&_nc_zt=23&_nc_ht=scontent.fpnh5-4.fna&_nc_gid=An_IU8Vg9oEfofNZIieMoBS&oh=00_AYBcwGpgHKq94EZNGNmrETYgvl9gz9S1EV-dHsKZRDh7Sw&oe=679C4646'
      },
      {
        'name': 'Cold',
        'imageUrl': 'https://scontent.fpnh5-3.fna.fbcdn.net/v/t39.30808-6/396452196_838308834722546_5029948853331897279_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeFVDbnFDdXcPb4XwNNdPevhvVgIJ3NWhSC9WAgnc1aFIGX4WCpn6uHDYC3djL0UEAD9fviNpG_n3eZmPdmdUO35&_nc_ohc=ogwmAbtCFmYQ7kNvgH4zUcs&_nc_oc=AdjaxUDD_RyZEi28HsKRvCQQBZ3217EWSiVjYauCfRGjrzskiEqVddLV4ihzu5U9Lb4&_nc_zt=23&_nc_ht=scontent.fpnh5-3.fna&_nc_gid=A9TQ7cPri0r_U7G72i9V3iL&oh=00_AYDNKhvQFu7Z0Rb9cs7cYyenDdr54-UAnQ6ovnzpk9P0MQ&oe=679C5DAF'
      },
      {
        'name': 'You',
        'imageUrl': 'https://scontent.fpnh5-5.fna.fbcdn.net/v/t39.30808-6/418551963_881240163762746_3800476193821702918_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeE9MHcG2e6Rb6vivmbpSOlOFApPwAgO34QUCk_ACA7fhAIBTRa7Clh9qISH0r0vR96o3bK8ajiKm_HkavrYRThx&_nc_ohc=uHewZp1nqmAQ7kNvgEIk72B&_nc_oc=Adj_RD0jiXEUVgx_rRyoSzIeNMUo5vmdLfpvsKt1Ozwfpi4HZJ-9wgaVBIiQ6ZzQHpo&_nc_zt=23&_nc_ht=scontent.fpnh5-5.fna&_nc_gid=AEx7aE47kzGwLMcQUICDH8p&oh=00_AYD_djHfNl8bjwJTeMTOvoLv_QNyLQfzCbsfh4cmlUAS5w&oe=679C2990'
      },
      {
        'name': 'Miss',
        'imageUrl':
        'https://scontent.fpnh5-5.fna.fbcdn.net/v/t51.75761-15/472198987_18032038604422584_2863467820336733406_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=127cfc&_nc_eui2=AeGegyDhrK1BOhH8nYVFwhVWIhrP_nou0MMiGs_-ei7Qw4jd9U7U8Fuep4NyFgLh1aROlHjRWXRPl0SPcFWCakwT&_nc_ohc=Vf496kkQTPUQ7kNvgEPHSV-&_nc_oc=Adii6Gzr_ixSs4aNUDXa4dYoCj8VyfT1Vi3bZ7wJiVIOOfKYKgiEzfxscah_oMvUrL4&_nc_zt=23&_nc_ht=scontent.fpnh5-5.fna&_nc_gid=AWRhi_lxcihSB5tgPIga8rN&oh=00_AYCZg5pyrtJFheu2XBqz3SXYa3n9nMDy3P3qLSBCv8x4LA&oe=679C3F17'
      },
      {
        'name': 'Love',
        'imageUrl': 'https://scontent.fpnh5-4.fna.fbcdn.net/v/t39.30808-6/411715423_869949071558522_293583663532141857_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeE4nJJ7NQaGsxLWu8tIRCkhCoJCnIMfsFoKgkKcgx-wWvNzt2VaMYr6SQ2GB4upthkvj1mz6srskpFqkuVo6CK8&_nc_ohc=sgvgssTHTHMQ7kNvgF1uwGL&_nc_oc=AdjX6-X9O-m6K_qAN8pz4RKzzLeRodGJHxrjd5MdwwQZ3ZX9Hp6iFoQpX_teAZBghnc&_nc_zt=23&_nc_ht=scontent.fpnh5-4.fna&_nc_gid=Aa-wBZMGjl4bFPgYa8RpbXj&oh=00_AYBvjCt_yWp_NKBO67aKl8NPrPNtnTwaybfVSKk16ykx0g&oe=679C31D7'
      },
      {
        'name': 'Wow',
        'imageUrl': 'https://scontent.fpnh5-2.fna.fbcdn.net/v/t39.30808-6/375293879_804535878099842_4796644262234078021_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeHO37pvCePNgNIB9xBCB3LZOO0a1ZkqYhY47RrVmSpiFlAONV7KusIfBe2v70R5tCKd1OCLkt59WQSRKR2jqoX6&_nc_ohc=lZGx7-ULv4QQ7kNvgHtD-qw&_nc_oc=Adh_GLHveKXbUCg7YyC6JVxn_Dwy1nolRS7tHAedkZSxjtk-IUyxJYOvniND7wBhgM4&_nc_zt=23&_nc_ht=scontent.fpnh5-2.fna&_nc_gid=Ap2kae7S4QVb8ECND4HeX3a&oh=00_AYANf3jwJzr80uT5WxLAvsfrmLqF3EphEQJSWPy90yK0fg&oe=679C3C30'
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    theme.appBarTheme.backgroundColor ?? theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.appBarTheme.foregroundColor ??
                          theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    theme.appBarTheme.backgroundColor ?? theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Share profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.appBarTheme.foregroundColor ??
                          theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Horizontal list of profiles
          SizedBox(
            height: 120, // Set a fixed height for the row
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: profiles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(84),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            profiles[index]['imageUrl']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        profiles[index]['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

