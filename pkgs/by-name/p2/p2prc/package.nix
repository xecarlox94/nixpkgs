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
        rev     = "v${version}";
        hash    = "sha256-LW6UKEF9txWXyVP2deRiWFuNqfNTp0ZfXZs+n+TbAZc=";
    };

    vendorHash = null;

    #outputs = [ "docker" ];

    meta = with lib; {
        description = "p2p network to enable running distributed computation and rendering";
        homepage    = "https://p2prc.akilan.io/";
        license     = lib.licenses.gpl2;
        maintainers = with lib.maintainers; [];
    };

}
