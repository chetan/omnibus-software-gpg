
name "libsodium"
default_version "0.4.5"

source :url => "https://download.libsodium.org/libsodium/releases/libsodium-#{version}.tar.gz",
       :md5 => "3a97d2c29ec0133e334036e3f19d0741"

relative_path "libsodium-#{version}"

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
