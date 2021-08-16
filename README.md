# probe-rs flash loader for gd32vf103

This crate provides a flash loader for the gd32vf103

It is a port of the reference algorithm provided by Segger for this device, which you can find at
https://wiki.segger.com/Open_Flashloader#RISC-V_template_projects

Based on https://github.com/Tiwalun/hifive-flashloader, and the information at 
https://www.keil.com/pack/doc/CMSIS/Pack/html/flashAlgorithm.html and
https://wiki.segger.com/Open_Flashloader

It is designed to be used with [probe-rs](https://github.com/probe-rs/probe-rs),
but should be usable with other tools which use flash loaders based on the ARM
CMSIS-PACK standard.

## Build

To build the flashloader, only a Rust compiler with support for RISCV must be installed.
See http://rustup.rs for installation instructions for Rust. The riscv target can be added
using rustup:

    rustup target install rustup target install riscv32imac-unknown-none-elf

The flash loader can then be compiled using cargo:

   cargo build --release

The resulting binary can be found in `target/riscv32imac-unknown-none-elf/release/gd32vf103-flashloader`.


# Creating a target description file

To use the flashloader with probe-rs, a target description file needs to be created. This can be done
using the [target-gen](https://github.com/probe-rs/target-gen) tool. Assuming the flash loader
was built in release mode, and `target-gen` is installed:

    target-gen elf target/riscv32imac-unknown-none-elf/release/gd32vf103-flashloader gd32vf103.yml

The resulting target description file can be found in `gd32vf103.yml`. The flash algorithm will
already be populated, the remaining entries have to be filled in manually.

Alternatively, you may run the regen script which will build and run target-gen for you

    ./regen.sh
