import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuTooltip extends StatelessWidget {
  const MenuTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'assets/icons/ic_more_vert.svg',
        width: 20,
        height: 20,
      ),
      onPressed: () async {
        final RenderBox button = context.findRenderObject() as RenderBox;
        final RenderBox overlay =
            Overlay.of(context).context.findRenderObject() as RenderBox;
        final Offset offset =
            button.localToGlobal(Offset.zero, ancestor: overlay);

        await showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            offset.dx - 114,
            offset.dy + button.size.height,
            offset.dx + button.size.width,
            offset.dy,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.white,
          items: [
            PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_edit.svg',
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  const Text('Edit history title'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_delete.svg',
                    width: 18,
                    height: 18,
                  ),
                  const SizedBox(width: 8),
                  const Text('Delete', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
