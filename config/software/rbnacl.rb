
name "rbnacl"
default_version "2.0.0"

dependencies %w{ libsodium rubygems }

build do
  build_gem(name, version)
end
