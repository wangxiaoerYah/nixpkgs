{ lib
, buildPythonPackage
, fetchFromGitHub

# build-system
, setuptools

# dependencies
, django

# tests
, pytest-django
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "django-mysql";
  version = "4.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adamchainz";
    repo = "django-mysql";
    rev = "refs/tags/${version}";
    hash = "sha256-hIvkLLv9R23u+JC6t/zwbMvmgLMstYp0ytuSqNiohJg=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    django
  ];

  doCheck = false; # requires mysql/mariadb server

  env.DJANGO_SETTINGS_MODULE = "tests.settings";

  nativeCheckInputs = [
    pytest-django
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "django_mysql"
  ];

  meta = with lib; {
    changelog = "https://github.com/adamchainz/django-mysql/blob/${version}/docs/changelog.rst";
    description = "Extensions to Django for use with MySQL/MariaD";
    homepage = "https://github.com/adamchainz/django-mysql";
    license = licenses.mit;
    maintainers = with maintainers; [ hexa ];
  };
}
