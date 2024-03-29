{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {

    pname = "p2prc";
    version = "2.0.0";

    src = fetchFromGitHub {
        owner   = "akilan1999";
        repo    = "p2p-rendering-computation";
        rev     = "sha256-aa4b18f39d260c94d84ff2957e4e24c6813ee38a";
        # hash    = "sha256-LW6UKEF9txWXyVP2deRiWFuNqfNTp0ZfXZs+n+TbAZc=";
    };

    vendorHash = lib.fakeHash;
    #outputs = [ "docker" ];

    meta = with lib; {
        description = "p2p network to enable running distributed computation and rendering";
        homepage    = "https://github.com/Akilan1999/p2p-rendering-computation/";
        changelog   = "https://github.com/Akilan1999/p2p-rendering-computation/releases/tag/v${version}";
        license     = lib.licenses.gpl2;
        maintainers = with lib.maintainers; [ xecarlox94 ];
    };

}
