
name "rbnacl"
default_version "3.1.2"

dependencies %w{ libsodium rubygems }

build do
  build_gem(name, version)
end
