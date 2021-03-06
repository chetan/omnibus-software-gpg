
name "libksba"
default_version "1.3.0"

source :url => "ftp://ftp.gnupg.org/gcrypt/libksba/libksba-#{version}.tar.bz2",
       :md5 => "cd86fad9c9d360b2cf80449f8a4a4075"

relative_path "libksba-#{version}"

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
