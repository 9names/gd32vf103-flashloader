#!/bin/sh
cargo build --release
target-gen elf -u target/riscv32imac-unknown-none-elf/release/gd32vf103-flashloader gd32vf103.yaml

