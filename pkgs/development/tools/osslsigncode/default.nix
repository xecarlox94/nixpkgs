{ lib, stdenv
, fetchFromGitHub
, autoreconfHook
, libgsf
, pkg-config
, openssl
, curl
}:

stdenv.mkDerivation rec {
  pname = "osslsigncode";
  version = "2.2";

  src = fetchFromGitHub {
    owner = "mtrojnar";
    repo = pname;
    rev = version;
    sha256 = "sha256-/YKj6JkVbQ4Fz+KSmBIRQ7F7A8fxi5Eg+pvKwhjpGYQ=";
  };

  nativeBuildInputs = [ autoreconfHook libgsf pkg-config openssl curl ];

  meta = with lib; {
    homepage = "https://github.com/mtrojnar/osslsigncode";
    description = "OpenSSL based Authenticode signing for PE/MSI/Java CAB files";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ mmahut prusnak ];
    platforms = platforms.all;
  };
}
