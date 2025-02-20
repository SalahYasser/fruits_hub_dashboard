import 'dart:io';

import 'package:dartz/dartz.dart';

abstract class ImagesRepo {

  Future<Either<Future, String>> uploadImage(File image);
}