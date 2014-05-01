
name "rbnacl"
default_version "3.0.0"

dependencies %w{ libsodium rubygems }

build do
  build_gem(name, version)
end
