
name "gpgme"
version "1.4.3"

dependency "gpg"

source :url => "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-#{version}.tar.bz2",
       :md5 => "334e524cffa8af4e2f43ae8afe585672"

relative_path "gpgme-#{version}"

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
