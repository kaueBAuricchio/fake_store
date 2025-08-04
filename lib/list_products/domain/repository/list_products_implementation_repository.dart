import 'package:dartz/dartz.dart';
import 'package:fake_store/core/error/failure.dart';
import 'package:fake_store/list_products/data/datasource/list_products_datasource.dart';
import 'package:fake_store/list_products/data/model/mapper/product_mapper.dart';
import 'package:fake_store/list_products/domain/entity/product_entity.dart';
import 'package:fake_store/list_products/domain/repository/list_products_repository.dart';

class ListProductsImplementationRepository implements IListProductsRepository {
  final IListProductsDatasource datasource;

  ListProductsImplementationRepository(this.datasource);

  @override
  Future<Either<Failure, List<ProductEntity>>> listProducts() async {
    try {
      final result = await datasource.listProducts();
      return Right(result.toListEntity());
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(DataPostFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> listProductsPaginated(
    int page,
    int limit,
  ) async {
    try {
      final result = await datasource.listProducts();
      final paginated = result.skip(page * limit).take(limit).toList();
      return Right(paginated.toListEntity());
    } catch (e) {
      return Left(DataPostFailure(message: e.toString()));
    }
  }
}
