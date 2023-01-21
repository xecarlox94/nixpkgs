{ lib
, buildPythonPackage
, fetchFromGitHub
, pytest-asyncio
, pytestCheckHook
, pythonOlder
, setuptools-scm
}:

buildPythonPackage rec {
  pname = "aioshutil";
  version = "1.2";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "kumaraditya303";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-HDN170lKxMj5vK94dn0sNXNDKoksg1tJ8G+vZEU7g/4=";
  };

  SETUPTOOLS_SCM_PRETEND_VERSION = version;

  nativeBuildInputs = [
    setuptools-scm
  ];

  nativeCheckInputs = [
    pytest-asyncio
    pytestCheckHook
  ];

  postPatch = ''
    substituteInPlace setup.cfg \
      --replace " --cov aioshutil --cov-report xml" ""
  '';

  pythonImportsCheck = [
    "aioshutil"
  ];

  meta = with lib; {
    description = "Asynchronous version of function of shutil module";
    homepage = "https://github.com/kumaraditya303/aioshutil";
    license = with licenses; [ bsd3 ];
    maintainers = with maintainers; [ fab ];
  };
}
