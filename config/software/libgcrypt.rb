
name "libgcrypt"
version "1.6.1"

dependency "libgpg-error"

source :url => "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-#{version}.tar.bz2",
       :md5 => "a5a5060dc2f80bcac700ab0236ea47dc"

relative_path "libgcrypt-#{version}"

configure_env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "GPG_ERROR_CONFIG" => "/#{install_dir}/embedded/bin/gpg-error-config"
}

build do
  command "./configure --prefix=#{install_dir}/embedded", :env => configure_env
  command "make -j #{max_build_jobs}", :env => {"LD_RUN_PATH" => "#{install_dir}/embedded/lib"}
  command "make install"
end
