source $HOME/.cargo/env
export PATH="$HOME/.cargo/bin:$PATH"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
alias cbr='cargo build && cargo run -- -h'
