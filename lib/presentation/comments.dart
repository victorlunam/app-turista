import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> comments = [
  {
    "photo": "assets/images/users/user_1.png",
    "fullname": "Adolfo Aguilar",
    "comment":
        "Hola, la semana pasada estuve en Cuzco y no encontré transporte para ir a las ruinas. Sabes que sucedió?",
    "createdAt": "2022-03-04 13:00:00",
    "liked": false,
    "numberOfLikes": 343,
    "answers": null,
  },
  {
    "photo": "assets/images/users/user_2.png",
    "fullname": "Sofia Santinni",
    "comment":
        "Hubo ciertos percances en los trasportes durante dos semanas por las diversas huelgas de agricultores en la zona.",
    "createdAt": "2022-03-04 12:50:00",
    "liked": true,
    "numberOfLikes": 12,
    "answers": [
      {
        "photo": "assets/images/users/user_1.png",
        "fullname": "Pedro Aguilar",
        "comment":
            "Confirmo lo que acaba de mencionar Sofia, pero ya a partir de esta semana todo esta funcionando con normalidad. Todos a Cuzco!!!!",
        "createdAt": "2022-03-04 12:53:00",
        "liked": true,
        "numberOfLikes": 46,
        "answers": null,
      }
    ],
  },
  {
    "photo": "assets/images/users/user_3.png",
    "fullname": "Jimmi Neutron",
    "comment":
        "Hubo ciertos percances en los trasportes durante dos semanas por las diversas huelgas de agricultores en la zona.",
    "createdAt": "2022-03-04 11:43:00",
    "liked": false,
    "numberOfLikes": 32,
    "answers": null,
  },
];

class CommentsPage extends StatefulWidget {
  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final _scrollController = ScrollController();

  String timeElapsed(String time) {
    final today = DateTime.now();
    DateTime time0 = DateTime.parse(time);
    Duration duration = today.difference(time0);
    return duration.inMinutes.toString();
  }

  Widget _commentsList() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return _commentItem(comments[index]);
        },
      ),
    );
  }

  Widget _commentItem(Map<String, dynamic> comment) {
    return Container(
      padding: const EdgeInsets.all(globalSpacing),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(comment['photo']),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: globalSpacing),
                  padding: const EdgeInsets.symmetric(
                    vertical: globalSpacing / 2,
                    horizontal: globalSpacing,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF1F1F1),
                    borderRadius:
                        BorderRadius.all(Radius.circular(globalBorderRadius)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comment['fullname']),
                      Text(comment['comment']),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(width: globalSpacing),
                    Text(
                      "${timeElapsed(comment['createdAt'])} min",
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(width: globalSpacing),
                    Text(
                      "${comment['numberOfLikes']} me gusta",
                      style: const TextStyle(fontSize: 12),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Responder',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    InkWell(
                      onTap: () {},
                      child: comment['liked']
                          ? SvgPicture.asset(
                              'assets/icons/favorite_filled.svg',
                              height: globalSizeIconSmall,
                              color: const Color(0xFFFF2953),
                            )
                          : SvgPicture.asset(
                              'assets/icons/favorite.svg',
                              height: globalSizeIconSmall,
                              color: const Color(0xFFB1B1B1),
                            ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _commentTextField() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        globalSpacing,
        0,
        globalSpacing,
        globalSpacing,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: globalSpacing,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.all(
          Radius.circular(globalBorderRadius),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/users/user_1.png'),
          ),
          const SizedBox(width: globalSpacing),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100,
              ),
              child: const Scrollbar(
                child: TextField(
                  maxLines: null,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Comentar",
                    hintStyle: TextStyle(
                      color: Color(0xff939393),
                    ),
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Enviar',
              style: TextStyle(
                color: Color(0xff939393),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentarios'),
        centerTitle: true,
        leading: buildBackButton(context),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _commentsList(),
            _commentTextField(),
          ],
        ),
      ),
    );
  }
}
