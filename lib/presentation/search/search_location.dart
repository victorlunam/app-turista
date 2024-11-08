import 'package:app_turista/presentation/widgets/appbar_backbutton.dart';
import 'package:app_turista/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List<Map<String, dynamic>> searchLocation = [
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Restaurantes trujillo",
    "type": "location"
  },
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Bar trujillo",
    "type": "location"
  },
  {
    "leading": "assets/icons/pin_map.svg",
    "title": "Plaza de trujillo",
    "type": "location"
  },
];

class SearchLocationPage extends StatelessWidget {
  const SearchLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildBackButton(context),
        title: const Text('Agregar Lugar'),
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
        itemCount: searchLocation.length,
        itemBuilder: (context, index) {
          var result = searchLocation[index];
          return ListTile(
            title: Text(result['title']),
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF939393),
              radius: 21,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset(
                  'assets/icons/pin_map.svg',
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
