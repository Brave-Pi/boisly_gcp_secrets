class Install {
	static function main() {
		Sys.command('npx', ['dts2hx', '@google-cloud/secret-manager','--modular']);
        // else throw 'Invalid command line argument.';
	}
}
