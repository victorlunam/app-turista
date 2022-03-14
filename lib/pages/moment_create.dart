import 'package:appturista/utils/global_variables.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MomentCreate extends StatefulWidget {
  const MomentCreate({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  State<MomentCreate> createState() => _MomentCreateState();
}

class _MomentCreateState extends State<MomentCreate> {
  bool allowComments = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset('./assets/icons/backbutton.svg'),
        ),
        title: const Text('Crear Momento'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: globalSpacing),
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(widget.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset('./assets/icons/plus.svg'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: globalSpacing * 2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: globalSpacing),
                    child: SvgPicture.asset(
                      './assets/icons/pencil.svg',
                      height: globalSizeIcon,
                      color: Colors.black,
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
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Cuentale tu momento al mundo...',
                            border: InputBorder.none,
                            counterText: '90 caracteres',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: globalSpacing * 3),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/hash.svg',
                    height: globalSizeIcon,
                    color: Colors.black,
                  ),
                  const SizedBox(width: globalSpacing),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/search/hashtag'),
                    child: const Expanded(
                      child: Text('Agregar Hashtags'),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: globalSpacing * 3),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/pin_map.svg',
                    height: globalSizeIcon,
                    color: Colors.black,
                  ),
                  const SizedBox(width: globalSpacing),
                  const Text('Lugar'),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/search/location'),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        const Text('Cuzco, Peru'),
                        SvgPicture.asset(
                          './assets/icons/forward.svg',
                          height: globalSizeIcon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: globalSpacing * 3),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
              child: Row(
                children: [
                  SvgPicture.asset(
                    './assets/icons/eye.svg',
                    height: globalSizeIcon * 0.6,
                    color: Colors.black,
                  ),
                  const SizedBox(width: globalSpacing),
                  const Text('Mostrar a'),
                  const Expanded(child: SizedBox()),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, '/moment/visibility'),
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    child: Row(
                      children: [
                        const Text('Público'),
                        SvgPicture.asset(
                          './assets/icons/forward.svg',
                          height: globalSizeIcon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: globalSpacing * 2),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: globalSpacing * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Permitir Comentarios'),
                  Switch(
                    value: allowComments,
                    onChanged: (value) {
                      setState(() {
                        allowComments = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              width: 120,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                  arguments: 1,
                ),
                child: const Text(
                  'Publicar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF4E9028),
                ),
              ),
            ),
            const SizedBox(height: globalSpacing * 2),
          ],
        ),
      ),
    );
  }
}
