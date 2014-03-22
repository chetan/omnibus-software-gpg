
name "gpg"
version "2.0.22"

dependency "libassuan"
dependency "libgpg-error"
dependency "libgcrypt"
dependency "libksba"

source :url => "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-#{version}.tar.bz2",
       :md5 => "ee22e7b4fdbfcb50229c2e6db6db291e"

relative_path "gnupg-#{version}"

configure_env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", :env => configure_env
  command "make -j #{max_build_jobs}", :env => {"LD_RUN_PATH" => "#{install_dir}/embedded/lib"}
  command "make install"
end