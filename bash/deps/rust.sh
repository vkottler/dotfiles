. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export RUST_SRC_PATH
alias cbr='cargo build && cargo run -- -h'
