
name "gpg"
version "2.0.22"

dependency "libassuan"
dependency "libgpg-error"
dependency "libgcrypt"
dependency "libksba"
dependency "pth"

source :url => "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-#{version}.tar.bz2",
       :md5 => "ee22e7b4fdbfcb50229c2e6db6db291e"

relative_path "gnupg-#{version}"

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
           "--with-libgcrypt-prefix=#{prefix}",
           "--with-libassuan-prefix=#{prefix}",
           "--with-ksba-prefix=#{prefix}"
           ].join(" "), :env => configure_env
  command "make -j #{max_build_jobs}", :env => {"LD_RUN_PATH" => "#{prefix}/lib"}
  command "make install"
end
