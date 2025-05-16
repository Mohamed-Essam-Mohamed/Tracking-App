import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/profile/domain/data_source/profile_data_source.dart';
import 'package:tracking_app/features/profile/domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  ProfileRepositoryImp(this._profileDataSource);
  ProfileDataSource _profileDataSource;
}


 // Future<Result<>>
    // ex
    // @override
    // Future<Result<String>> function() async => await _dataSource.function();