
name "gpgme"
default_version "1.4.3"

dependency "gpg"

source :url => "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-#{version}.tar.bz2",
       :md5 => "334e524cffa8af4e2f43ae8afe585672"

relative_path "gpgme-#{version}"

prefix = "#{install_dir}/embedded"
configure_env = {
  "LDFLAGS" => "-L#{prefix}/lib -I#{prefix}/include",
  "CFLAGS" => "-L#{prefix}/lib -I#{prefix}/include",
  "LD_RUN_PATH" => "#{prefix}/lib"
}

build do
  command ["./configure",
           "--prefix=#{prefix}",
           "--with-libgpg-error-prefix=#{prefix}",
           "--with-libassuan-prefix=#{prefix}",
           "--with-gpgconf=#{prefix}/bin/gpgconf"
           ].join(" "), :env => configure_env
  command "make -j #{max_build_jobs}", :env => {"LD_RUN_PATH" => "#{prefix}/lib"}
  command "make install"
end
