#30 237.4   cargo:rerun-if-env-changed=RANLIBFLAGS_x86_64-unknown-linux-gnu
#30 237.4   RANLIBFLAGS_x86_64-unknown-linux-gnu = None
#30 237.4   running cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && env -u CROSS_COMPILE AR="ar" CC="cc" RANLIB="ranlib" "perl" "./Configure" "--prefix=/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/install" "--openssldir=/usr/local/ssl" "no-shared" "no-module" "no-tests" "no-comp" "no-zlib" "no-zlib-dynamic" "--libdir=lib" "no-ssl3" "no-md2" "no-rc5" "no-weak-ssl-ciphers" "no-camellia" "no-idea" "no-seed" "linux-x86_64" "-O2" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-gdwarf-4" "-fno-omit-frame-pointer" "-m64" "-w"
#30 237.4   cargo:warning=configuring OpenSSL build: 'perl' reported failure with exit status: 2
#30 237.4   cargo:warning=openssl-src: failed to build OpenSSL from source
#30 237.4
#30 237.4   --- stderr
#30 237.4   Can't locate FindBin.pm in @INC (you may need to install the FindBin module) (@INC contains: /etc/perl /usr/local/lib/x86_64-linux-gnu/perl/5.36.0 /usr/local/share/perl/5.36.0 /usr/lib/x86_64-linux-gnu/perl5/5.36 /usr/share/perl5 /usr/lib/x86_64-linux-gnu/perl-base /usr/lib/x86_64-linux-gnu/perl/5.36 /usr/share/perl/5.36 /usr/local/lib/site_perl) at ./Configure line 15.
#30 237.4   BEGIN failed--compilation aborted at ./Configure line 15.
#30 237.4
#30 237.4
#30 237.4
#30 237.4   Error configuring OpenSSL build:
#30 237.4       'perl' reported failure with exit status: 2
#30 237.4       Command failed: cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && env -u CROSS_COMPILE AR="ar" CC="cc" RANLIB="ranlib" "perl" "./Configure" "--prefix=/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/install" "--openssldir=/usr/local/ssl" "no-shared" "no-module" "no-tests" "no-comp" "no-zlib" "no-zlib-dynamic" "--libdir=lib" "no-ssl3" "no-md2" "no-rc5" "no-weak-ssl-ciphers" "no-camellia" "no-idea" "no-seed" "linux-x86_64" "-O2" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-gdwarf-4" "-fno-omit-frame-pointer" "-m64" "-w"
#30 237.4
#30 237.4
#30 237.4
#30 237.4 warning: build failed, waiting for other jobs to finish...
#30 ERROR: process "/bin/sh -c cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review" did not complete successfully: exit code: 101
------
 > [builder 9/9] RUN --mount=type=cache,target=/usr/local/cargo/registry     --mount=type=cache,target=/usr/local/cargo/git     --mount=type=cache,target=/app/target     cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review:
237.4
237.4
237.4
237.4   Error configuring OpenSSL build:
237.4       'perl' reported failure with exit status: 2
237.4       Command failed: cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && env -u CROSS_COMPILE AR="ar" CC="cc" RANLIB="ranlib" "perl" "./Configure" "--prefix=/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/install" "--openssldir=/usr/local/ssl" "no-shared" "no-module" "no-tests" "no-comp" "no-zlib" "no-zlib-dynamic" "--libdir=lib" "no-ssl3" "no-md2" "no-rc5" "no-weak-ssl-ciphers" "no-camellia" "no-idea" "no-seed" "linux-x86_64" "-O2" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-gdwarf-4" "-fno-omit-frame-pointer" "-m64" "-w"
237.4
237.4
237.4
237.4 warning: build failed, waiting for other jobs to finish...
------
Dockerfile:43

--------------------

  42 |     # Build all binaries

  43 | >>> RUN --mount=type=cache,target=/usr/local/cargo/registry \

  44 | >>>     --mount=type=cache,target=/usr/local/cargo/git \

  45 | >>>     --mount=type=cache,target=/app/target \

  46 | >>>     cargo build --locked --release --bin server --bin mcp_task_server --bin review \

  47 | >>>  && mkdir -p /app/bin \

  48 | >>>  && cp target/release/server /app/bin/server \

  49 | >>>  && cp target/release/mcp_task_server /app/bin/mcp_task_server \

  50 | >>>  && cp target/release/review /app/bin/review

  51 |

--------------------

failed to solve: process "/bin/sh -c cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review" did not complete successfully: exit code: 101
