
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopsphere/core/network/dio_client.dart';

final dioProvider = Provider<Dio>((ref) =>  Dio());

final dioClientProvider = Provider<DioClient>((ref) => DioClient(ref.watch(dioProvider)));