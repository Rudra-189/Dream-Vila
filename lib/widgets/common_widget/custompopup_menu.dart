import 'package:dreamvila/core/utils/exports.dart';
import 'package:flutter/material.dart';

void showContextMenu(BuildContext context, Offset offset,String id,Property property) async {
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
    NavigatorService.pushNamed(AppRoutes.addProductScreen,arguments: {
      'isUpdate': true,
      'data': property
    });
  }else{
    context.read<HomeBloc>().add(OnProductDelete(id));
  }
}
