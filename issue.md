#30 585.8    Compiling tracing-subscriber v0.3.22
#30 601.8    Compiling ecdsa v0.16.9
#30 606.8    Compiling zvariant_derive v5.8.0
#30 614.9    Compiling sqlx-sqlite v0.8.6
#30 638.4 error: failed to run custom build command for `libsqlite3-sys v0.30.1`
#30 638.5
#30 638.5 Caused by:
#30 638.5   process didn't exit successfully: `/app/target/release/build/libsqlite3-sys-9aeb4839fcc508b5/build-script-build` (exit status: 101)
#30 638.5   --- stdout
#30 638.5   cargo:rerun-if-env-changed=LIBSQLITE3_SYS_USE_PKG_CONFIG
#30 638.5   cargo:rerun-if-env-changed=LIBSQLITE3_SYS_BUNDLING
#30 638.5
#30 638.5   --- stderr
#30 638.5
#30 638.5   thread 'main' panicked at /usr/local/cargo/registry/src/index.crates.io-1949cf8c6b5b557f/bindgen-0.69.5/lib.rs:622:31:
#30 638.5   Unable to find libclang: "couldn't find any valid shared libraries matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a path where one of these files can be found (invalid: [])"
#30 638.5   note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
#30 638.5 warning: build failed, waiting for other jobs to finish...
