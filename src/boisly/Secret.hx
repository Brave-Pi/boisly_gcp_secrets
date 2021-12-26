package boisly;

import tink.CoreApi;
import google_cloud.secret_manager.build.protos.protos.google.cloud.secretmanager.v1.IAccessSecretVersionResponse;

abstract Secret(String) from String {
	@:to public function reveal():Promise<tink.Chunk> {
		return Gatekeeper.client.accessSecretVersion({
			name: this
		}).then(d -> (d.element0.payload.data : Dynamic))
        .then((buf:js.node.Buffer) -> (buf : tink.Chunk));
	}
}
