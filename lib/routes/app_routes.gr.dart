// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_demo_task/domain/model/message_data_model.dart' as _i5;
import 'package:flutter_demo_task/presentation/pages/home_page.dart' as _i1;
import 'package:flutter_demo_task/presentation/pages/list_view_page.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ListMessageRoute.name: (routeData) {
      final args = routeData.argsAs<ListMessageRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ListMessagePage(
          key: args.key,
          listData: args.listData,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ListMessagePage]
class ListMessageRoute extends _i3.PageRouteInfo<ListMessageRouteArgs> {
  ListMessageRoute({
    _i4.Key? key,
    required _i5.ListItem listData,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ListMessageRoute.name,
          args: ListMessageRouteArgs(
            key: key,
            listData: listData,
          ),
          initialChildren: children,
        );

  static const String name = 'ListMessageRoute';

  static const _i3.PageInfo<ListMessageRouteArgs> page =
      _i3.PageInfo<ListMessageRouteArgs>(name);
}

class ListMessageRouteArgs {
  const ListMessageRouteArgs({
    this.key,
    required this.listData,
  });

  final _i4.Key? key;

  final _i5.ListItem listData;

  @override
  String toString() {
    return 'ListMessageRouteArgs{key: $key, listData: $listData}';
  }
}
