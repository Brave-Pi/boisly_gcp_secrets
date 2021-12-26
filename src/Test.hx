package;

import boisly.gatekeeper.Config.AppConfig;

@:config
class TestConfig extends AppConfig {
    public  var testSecret:String;
}
@:await class Test {
    @:await public static function main() {
        var secret:boisly.Secret = boisly.AppSettings.config.testSecret;
        try {
            $type(boisly.AppSettings.config);
            $type(@:await secret);
            trace(@:await secret);
        } catch(e:Dynamic) {
            trace(e);
        }
    }
}