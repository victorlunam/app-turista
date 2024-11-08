import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> searchHashTag = [
  {
    "leading": "assets/icons/hash.svg",
    "title": "#aventuraviajero",
    "type": "hashtag"
  },
  {
    "leading": "assets/icons/hash.svg",
    "title": "#nuevaaventura",
    "type": "hashtag"
  },
  {"leading": "assets/icons/hash.svg", "title": "#trujillo", "type": "hashtag"}
];

class SearchHashtagPage extends StatelessWidget {
  const SearchHashtagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: const Text('Agregar Hashtags'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            AppBar().preferredSize.height,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: globalSpacing),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: globalSpacing),
                      hintText: 'Buscar',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(globalBorderRadius),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: globalSpacing),
                SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: globalSizeIcon,
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchHashTag.length,
        itemBuilder: (context, index) {
          var result = searchHashTag[index];
          return ListTile(
            title: Text(result['title']),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF939393),
              radius: 21,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/hash.svg',
                  color: Colors.black,
                  height: globalSizeIcon,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
