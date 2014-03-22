
Gem::Specification.new do |s|
  s.name        = "omnibus-software-gpg"
  s.version     = "0.1"
  s.authors     = ["Chetan Sarva"]
  s.email       = ["chetan@pixelcop.net"]
  s.homepage    = "http://github.com/chetan/omnibus-software-gpg"
  s.summary     = %q{GnuPG configs for use with Omnibus}
  s.description = %q{GnuPG and related software build descriptions for use with Omnibus}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
