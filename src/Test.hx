package;

import boisly.gatekeeper.Config.AppConfig;

@:config
class TestConfig extends AppConfig {
    public  var testSecret:boisly.Secret;
}
@:await class Test {
    @:await public static function main() {
        var secret = boisly.AppSettings.config.testSecret;
        try {
            $type(boisly.AppSettings.config);
            $type(@:await secret);
            trace(@:await secret);
        } catch(e:Dynamic) {
            trace(e);
        }
    }
}