package boisly;

#if js
import tink.json.Representation;
import tink.CoreApi;
import google_cloud.secret_manager.build.protos.protos.google.cloud.secretmanager.v1.IAccessSecretVersionResponse;
#end

@:jsonParse(function(str:String):boisly.Secret return str)
abstract Secret(String) {
	#if js
	inline function new(v)
		this = v;

	@:from public static function ofString(v:String)
		return new Secret(v);

	@:to public function reveal():Promise<tink.Chunk> {
		return Gatekeeper.client.accessSecretVersion({
			name: this
		}).then(d -> (d.element0.payload.data : Dynamic)).then((buf:js.node.Buffer) -> (buf : tink.Chunk));
	}
	#end
}
