package boisly;
#if !(js&&!nodejs)
import tink.CoreApi;
import google_auth_library.JWT;
import google_gax.GoogleAuth;
import google_auth_library.GoogleAuth;
import google_cloud.secret_manager.build.src.v1.index.SecretManagerServiceClient;
import boisly.gatekeeper.Config;

@:await class Gatekeeper {
	public static var client(get, never):SecretManagerServiceClient;
	static var _client:SecretManagerServiceClient;

	public static function get_client() {
		if (_client == null) {
			_client = new SecretManagerServiceClient({
				credentials: {
					client_email: AppSettings.config.secrets.svc.clientEmail,
					private_key: sys.io.File.getContent(AppSettings.config.secrets.svc.privateKeyFile)
				}
			});
		}
		return _client;
	}
}
#end