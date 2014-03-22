
name "ruby-gpgme"
default_version "2.0.5"

dependencies %w{ gpgme rubygems }

build do
  build_gem("gpgme", version)
end
