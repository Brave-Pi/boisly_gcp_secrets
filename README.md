# boisly_gcp_secrets

Simple abstraction of Google Cloud Secret Manager.

```haxe
abstract Secret(String) from String{
	@:to public function reveal():Promise<tink.Chunk>;
}
```

This then allows you to do this:
```haxe
var mySecret:boisly.Secret = 'projects/<projectId>/secrets/<secretId>/versions/<versionId>';
mySecret.resolve().next(secret -> trace('Secret is: $secret'));
```

Or with `tink_await`:
```haxe
var mySecret:boisly.Secret = 'projects/<projectId>/secrets/<secretId>/versions/<versionId>';
trace('Secret is: '${@:await mySecret.resolve()});
```

Supports `tink_json` parsing.