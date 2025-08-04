import 'package:dartz/dartz.dart';
import 'package:fake_store/core/error/failure.dart';
import 'package:fake_store/list_products/domain/entity/product_entity.dart';

abstract class IListProductsRepository {
  Future<Either<Failure, List<ProductEntity>>> listProducts();
  Future<Either<Failure, List<ProductEntity>>> listProductsPaginated(
    int page,
    int limit,
  );
}
