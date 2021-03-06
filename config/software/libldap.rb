
name "libldap"
default_version "2.4.39"

dependency "cyrus-sasl"

source :url => "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/openldap-#{version}.tgz",
       :md5 => "b0d5ee4b252c841dec6b332d679cf943"

relative_path "openldap-#{version}"

configure_env = {
  "LDFLAGS"     => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS"      => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CPPFLAGS"    => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "./configure --disable-slapd --prefix=#{install_dir}/embedded", :env => configure_env
  command "make depend", :env => configure_env
  command "make -j #{max_build_jobs}", :env => configure_env
  command "cd libraries/libldap && make install", :env => configure_env
end
