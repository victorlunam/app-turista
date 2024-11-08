import 'package:app_turista/models/user.dart';
import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(this.user, {super.key});

  final User user;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Map<String, dynamic>> chats = [
    {"isOwner": false, "message": "Hola, como estas?"},
    {"isOwner": false, "message": "vi tus fotos estan geniales"},
    {"isOwner": true, "message": "Hola, Jim?"},
    {
      "isOwner": true,
      "message":
          "Esto realmente es un texto muy largo, muy; muy largo. tan largo que te cansaras de leerlo, asi que no lo leas."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: chatHeader(widget.user),
      ),
      body: builderMessage(context, chats),
      bottomNavigationBar: chatInputBottom(context, user: widget.user),
    );
  }
}

Widget chatHeader(User user) {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(user.photo),
      ),
      const SizedBox(width: globalSpacing),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.fullname,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const Text(
            'activo ahora',
            style: TextStyle(
              color: Color(0xFF939393),
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      )
    ],
  );
}

Widget chatInputBottom(BuildContext context, {User? user}) {
  double marginBottom = MediaQuery.of(context).viewInsets.bottom;
  return SafeArea(
    child: Container(
      margin: EdgeInsets.only(
        bottom: marginBottom + globalSpacing,
        left: globalSpacing,
        right: globalSpacing,
      ),
      padding: const EdgeInsets.symmetric(horizontal: globalSpacing),
      decoration: const BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.all(
          Radius.circular(globalBorderRadius * 2),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, '/camera', arguments: user),
            child: SvgPicture.asset(
              'assets/icons/camera.svg',
              height: globalSizeIcon,
            ),
          ),
          const SizedBox(width: globalSpacing),
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: Scrollbar(
                child: TextFormField(
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: 'Mensaje',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: globalSpacing),
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/picker'),
            child: SvgPicture.asset(
              'assets/icons/picture.svg',
              height: globalSizeIcon,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget chatMessage(BuildContext context, String message, bool isOwner) {
  double maxWidth = MediaQuery.of(context).size.width * 0.65;
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: globalSpacing / 5,
      horizontal: globalSpacing,
    ),
    child: Align(
      alignment: isOwner ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(globalSpacing),
        decoration: BoxDecoration(
          color: isOwner ? const Color(0xFF1996FF) : const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Text(
            message,
            style: TextStyle(
              color: isOwner ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget builderMessage(BuildContext context, List<Map<String, dynamic>> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return chatMessage(
        context,
        list.elementAt(index)['message'],
        list.elementAt(index)['isOwner'],
      );
    },
  );
}
