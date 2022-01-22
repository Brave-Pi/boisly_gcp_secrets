package;

import boisly.gatekeeper.Config.AppConfig;

@:config
class TestConfig extends AppConfig {
    public  var testSecret:boisly.Secret;
    public var testObj:boisly.Secret;
}
@:await class Test {
    @:await public static function main() {
        var secret = boisly.AppSettings.config.testSecret;
        try {
            $type(boisly.AppSettings.config);
            $type(@:await secret);
            trace(@:await secret);
            var t:tink.json.Serialized<{foo:String}> = cast (@:await boisly.AppSettings.config.testObj).toString();
            trace(t);
            final test:{foo:String} = t.parse();
            trace(test.foo);
        } catch(e:Dynamic) {
            trace(e);
        }
    }
}