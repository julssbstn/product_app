// Mocks generated by Mockito 5.3.0 from annotations
// in product_app/test/bloc/bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:product_app/bloc/product_bloc.dart' as _i4;
import 'package:product_app/models/product_details.dart' as _i3;
import 'package:product_app/models/products.dart' as _i6;
import 'package:product_app/webservices/product_webservice.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductWebService_0 extends _i1.SmartFake
    implements _i2.ProductWebService {
  _FakeProductWebService_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductDetails_1 extends _i1.SmartFake
    implements _i3.ProductDetails {
  _FakeProductDetails_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ProductBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductBloc extends _i1.Mock implements _i4.ProductBloc {
  MockProductBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductWebService get service => (super.noSuchMethod(
        Invocation.getter(#service),
        returnValue: _FakeProductWebService_0(
          this,
          Invocation.getter(#service),
        ),
      ) as _i2.ProductWebService);
  @override
  set service(_i2.ProductWebService? _service) => super.noSuchMethod(
        Invocation.setter(
          #service,
          _service,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Stream<_i6.Products> get productStream => (super.noSuchMethod(
        Invocation.getter(#productStream),
        returnValue: _i5.Stream<_i6.Products>.empty(),
      ) as _i5.Stream<_i6.Products>);
  @override
  _i5.Stream<num?> get pageStream => (super.noSuchMethod(
        Invocation.getter(#pageStream),
        returnValue: _i5.Stream<num?>.empty(),
      ) as _i5.Stream<num?>);
  @override
  void onPageChanged(num? page) => super.noSuchMethod(
        Invocation.method(
          #onPageChanged,
          [page],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i5.Future<void> getProducts({
    num? limit = 10,
    num? skip = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
          {
            #limit: limit,
            #skip: skip,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
  @override
  _i5.Future<_i3.ProductDetails> getProductDetails(num? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProductDetails,
          [id],
        ),
        returnValue: _i5.Future<_i3.ProductDetails>.value(_FakeProductDetails_1(
          this,
          Invocation.method(
            #getProductDetails,
            [id],
          ),
        )),
      ) as _i5.Future<_i3.ProductDetails>);
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
