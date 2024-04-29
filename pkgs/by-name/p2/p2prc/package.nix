with import <nixpkgs> {};

buildGoModule rec {

    pname = "p2prc";
    version = "2.0.0";
    #goPackagePath = "github.com/Akilan1999/p2p-rendering-computation";

    src = fetchFromGitHub {
        owner   = "akilan1999";
        repo    = "p2p-rendering-computation";
        rev     = "v${version}";
        hash    = "sha256-LW6UKEF9txWXyVP2deRiWFuNqfNTp0ZfXZs+n+TbAZc=";
    };

    vendorHash = "sha256-8lKhAHaRq6rs/W+f2RwH8Us1JDSOCawhE4ZvAkmhVuA=";
    #outputs = [ "docker" ];

    checkPhase = ''
      echo
    '';

    meta = with lib; {
        description = "p2p network to enable running distributed computation and rendering";
        homepage    = "https://github.com/Akilan1999/p2p-rendering-computation/";
        changelog   = "https://github.com/Akilan1999/p2p-rendering-computation/releases/tag/v${version}";
        license     = lib.licenses.gpl2;
        maintainers = with lib.maintainers; [ xecarlox94 ];
    };


    postBuild=''
        export P2PRC=$out/
    '';

        # export P2PRC=/nix/store/1xrpgifdj2d236k3f30jipzz5inda40y-p2prc-2.0.0/
        # export PATH=/nix/store/1xrpgifdj2d236k3f30jipzz5inda40y-p2prc-2.0.0/bin/:${PATH}

    shellHook=''
        echo "SHELL HOOK"
    '';

    fixupPhase=''
        cd $out
        $out/bin/p2p-rendering-computation --dc
        sed -i "s/8088/8078/g" p2p/iptable/ip_table.json
        sed -i "s/\"IPV4\": \"64.227.168.102\"/\"IPV4\": \"217.76.63.222\"/g;" p2p/iptable/ip_table.json
        cd $OLDPWD
    '';

}

