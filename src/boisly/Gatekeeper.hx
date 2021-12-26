package boisly;

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
					client_email: AppSettings.config.secrets.svc.client_email,
					private_key: sys.io.File.getContent('secrets.svc.pem')
				}
			});
		}
		return _client;
	}
}
