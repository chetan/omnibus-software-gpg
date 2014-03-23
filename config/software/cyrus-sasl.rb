
name "cyrus-sasl"
default_version "2.1.25"

source :url => "http://ftp.andrew.cmu.edu/pub/cyrus-mail/cyrus-sasl-#{version}.tar.gz",
       :md5 => "341cffe829a4d71f2a6503d669d5a946"

relative_path "cyrus-sasl-#{version}"

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
