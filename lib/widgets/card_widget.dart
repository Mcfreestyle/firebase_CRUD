import 'package:flutter/material.dart';

class HomeEventsCard extends StatelessWidget {
  final String name;
  final String date;
  final String place;
  final String image;
  final Function()? onTap;
  final Function()? deleteFunction;

  const HomeEventsCard({
    super.key,
    required this.name,
    required this.date,
    required this.place,
    required this.image,
    this.onTap,
    this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(15),
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              children: [
                FadeInImage(
                  placeholder: const AssetImage('assets/gifs/loading.gif'),
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        date,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        place,
                        style: const TextStyle(color: Color(0xff5C6066)),
                      ),
                      const Text(
                        '60 interesados - 50 asistirán',
                        style: TextStyle(color: Color(0xff5C6066)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: const Icon(Icons.star),
                            label: const Text('Me interesa'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff5C6066),
                              fixedSize: const Size(140, 35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {},
                          ),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.delete),
                            label: const Text('Eliminar'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: const Size(140, 35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: deleteFunction!,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class CardCustom extends StatelessWidget {
//   final Widget? title;
//   final Widget? leading;
//   final Widget? subtitle;
//   final Function()? onTap;

//   const CardCustom(
//       {super.key, this.title, this.leading, this.subtitle, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       child: Card(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: leading,
//               title: title,
//               subtitle: subtitle,
//             ),
//           ],
//         ),
//       ),
//       onTap: () => onTap!(),
//     );
//   }
// }
