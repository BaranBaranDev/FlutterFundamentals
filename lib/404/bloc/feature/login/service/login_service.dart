import '../model/login_model.dart';
import '../model/token_model.dart';
import 'package:vexana/vexana.dart';

class LoginService {
  final INetworkManager
      networkManager; // dışarıdan alıyoruz,vexana kullandık bu yapıda bu arada

  LoginService(this.networkManager);
  Future<IResponseModel<TokenModel?>?> login(LoginModel model) async {
    // geriye token döndürülecek ona ulaşmak istiyoruz ondan TokenModel yazdık sonra response type IResponseModel<TokenModel?> yazıyordu onu ekledik daha sağlıklı olur
    return await networkManager.send<TokenModel, TokenModel>('api/login',
        data: model, parseModel: TokenModel(), method: RequestType.POST);
  }
}
