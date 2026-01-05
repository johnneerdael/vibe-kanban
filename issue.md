ld/src" && env -u CROSS_COMPILE AR="ar" CC="cc" RANLIB="ranlib" "perl" "./Configure" "--prefix=/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/install" "--openssldir=/usr/local/ssl" "no-shared" "no-module" "no-tests" "no-comp" "no-zlib" "no-zlib-dynamic" "--libdir=lib" "no-ssl3" "no-md2" "no-rc5" "no-weak-ssl-ciphers" "no-camellia" "no-idea" "no-seed" "linux-x86_64" "-O2" "-ffunction-sections" "-fdata-sections" "-fPIC" "-g" "-gdwarf-4" "-fno-omit-frame-pointer" "-m64" "-w"
#30 61.03   Configuring OpenSSL version 3.5.4 for target linux-x86_64
#30 61.03   Using os-specific seed configuration
#30 61.03   Created configdata.pm
#30 61.03   Running configdata.pm
#30 61.03   Created Makefile.in
#30 61.03   Created Makefile
#30 61.03   Created include/openssl/configuration.h
#30 61.03
#30 61.03   **********************************************************************
#30 61.03   ***                                                                ***
#30 61.03   ***   OpenSSL has been successfully configured                     ***
#30 61.03   ***                                                                ***
#30 61.03   ***   If you encounter a problem while building, please open an    ***
#30 61.03   ***   issue on GitHub <https://github.com/openssl/openssl/issues>  ***
#30 61.03   ***   and include the output from the following command:           ***
#30 61.03   ***                                                                ***
#30 61.03   ***       perl configdata.pm --dump                                ***
#30 61.03   ***                                                                ***
#30 61.03   ***   (If you are new to OpenSSL, you might want to consult the    ***
#30 61.03   ***   'Troubleshooting' section in the INSTALL.md file first)      ***
#30 61.03   ***                                                                ***
#30 61.03   **********************************************************************
#30 61.03   running cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && "make" "depend"
#30 61.03   cargo:warning=building OpenSSL dependencies: Command 'make' not found. Is make installed?
#30 61.03   cargo:warning=openssl-src: failed to build OpenSSL from source
#30 61.03
#30 61.03   --- stderr
#30 61.03
#30 61.03
#30 61.03
#30 61.03   Error building OpenSSL dependencies:
#30 61.03       Command 'make' not found. Is make installed?
#30 61.03       Command failed: cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && "make" "depend"
#30 61.03
#30 61.03
#30 61.03
#30 61.03 warning: build failed, waiting for other jobs to finish...
#30 ERROR: process "/bin/sh -c cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review" did not complete successfully: exit code: 101
------
 > [builder 9/9] RUN --mount=type=cache,target=/usr/local/cargo/registry     --mount=type=cache,target=/usr/local/cargo/git     --mount=type=cache,target=/app/target     cargo build --locked --release --bin server --bin mcp_task_server --bin review  && mkdir -p /app/bin  && cp target/release/server /app/bin/server  && cp target/release/mcp_task_server /app/bin/mcp_task_server  && cp target/release/review /app/bin/review:
61.03
61.03
61.03
61.03   Error building OpenSSL dependencies:
61.03       Command 'make' not found. Is make installed?
61.03       Command failed: cd "/app/target/release/build/openssl-sys-ad0d6250e985b9f7/out/openssl-build/build/src" && "make" "depend"
61.03
61.03
61.03
61.03 warning: build failed, waiting for other jobs to finish...
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
