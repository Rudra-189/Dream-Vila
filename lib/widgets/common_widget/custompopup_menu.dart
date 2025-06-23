import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

void showContextMenu(BuildContext context, Offset offset,String id) async {
  final result = await showMenu(
    context: context,
    color: Colors.white,
    position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
    items: [
      const PopupMenuItem(value: 'update', child: Text('Update')),
      const PopupMenuItem(value: 'delete', child: Text('Delete')),
    ],
  );

  if(result == 'update'){

  }else{
    print(id);
    context.read<HomeBloc>().add(OnProductDelete(id));
  }
}
