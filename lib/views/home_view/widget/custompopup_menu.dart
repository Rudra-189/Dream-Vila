import 'package:dreamvila/core/utils/exports.dart';
import 'package:dreamvila/models/property_model/product_data_model.dart';
import 'package:flutter/material.dart';

void showContextMenu(BuildContext context, Offset offset,String id,Property property) async {
  final result = await showMenu(
    context: context,
    color: Colors.white,
    position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
    items: [
      const PopupMenuItem(value: 'update', child: Text('Update',style:TextStyle(fontSize: 12,color: Colors.black54),)),
      const PopupMenuItem(value: 'delete', child: Text('Delete',style:TextStyle(fontSize: 12,color: Colors.black54))),
    ],
  );

  if(result == 'update'){
    NavigatorService.pushNamed(AppRoutes.addProductScreen,arguments: {
      'isUpdate': true,
      'data': property
    });
  }else if(result == 'delete'){
    context.read<HomeBloc>().add(OnProductDelete(id));
  }
}
