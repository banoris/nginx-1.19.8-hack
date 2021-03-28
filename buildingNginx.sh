#!/bin/sh
export LLVM_COMPILER=clang
export LLVM_COMPILER_PATH=${HOME}/LLVM_6.0/bin
PREFIX=./builddir/
# CC=wllvm LDFLAGS="-static" ./configure --sbin-path=/usr/local/nginx/nginx \
#     --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pi \
#     --without-http_rewrite_module --without-pcre --with-http_gunzip_module --with-http_gzip_static_module \
#     --with-cc-opt='-g -O0 -Xclang -disable-O0-optnone'

# --prefix
CC=wllvm LDFLAGS="-static" ./configure --prefix=${PREFIX}
    --without-http_rewrite_module --without-pcre --with-http_gunzip_module --with-http_gzip_static_module \
    --with-cc-opt='-g -O0 -Xclang -disable-O0-optnone'
#--with-ld-opt='-L/usr/local/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/lib' --with-cc-opt='-I/usr/local/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -Wno-sign-compare -Wno-string-plus-int -Wno-deprecated-declarations -Wno-unused-parameter -Wno-unused-const-variable -Wno-conditional-uninitialized -Wno-mismatched-tags -Wno-sometimes-uninitialized -Wno-parentheses-equality -Wno-tautological-compare -Wno-self-assign -Wno-deprecated-register -Wno-deprecated -Wno-invalid-source-encoding -Wno-pointer-sign -Wno-parentheses -Wno-enum-conversion -Wno-c++11-compat-deprecated-writable-strings -Wno-write-strings -gsplit-dwarf' \
#--sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf \
#--with-compat --with-http_stub_status_module --with-http_secure_link_module --add-dynamic-module=../nginx-module-vts
#--with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream=dynamic --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.4.2 --add-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.31 --add-dynamic-module=../echo-nginx-module-0.61 --add-module=../redis2-nginx-module-0.14 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.18 --add-module=../srcache-nginx-module-0.31 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre=../pcre-8.41 --with-pcre-jit --with-zlib=../zlib-1.2.11
#--with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.0g --with-openssl-opt='enable-ec_nistp_64_gcc_128'

#--with-http_ssl_module

make -j4 LDFLAGS=-all-static
make install
