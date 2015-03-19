
name "libsodium"
default_version "1.0.2"

source :url => "https://download.libsodium.org/libsodium/releases/libsodium-#{version}.tar.gz",
       :md5 => "dc40eb23e293448c6fc908757738003f"

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
