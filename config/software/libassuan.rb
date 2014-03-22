
name "libassuan"
default_version "2.1.1"

source :url => "ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-#{version}.tar.bz2",
       :md5 => "757243cc4a71b30ed8d8dbe784035d36"

relative_path "libassuan-#{version}"

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
