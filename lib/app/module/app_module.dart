import 'package:dio/dio.dart';
import 'package:fake_store/list_products/data/datasource/list_products_datasource_implementation.dart';
import 'package:fake_store/list_products/domain/repository/list_products_implementation_repository.dart';
import 'package:fake_store/list_products/presentation/page/product_list_page.dart';
import 'package:fake_store/list_products/presentation/page/splash_screen_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => ListProductsDatasourceImplementation(i.get())),
    Bind((i) => ListProductsImplementationRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => const SplashPage()),
    ChildRoute('/products', child: (_, __) => const ProductListPage()),
  ];
}
