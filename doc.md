
# ququ

Ququ is way to build your archlinux reproducible without no dependencies.

All declarations will be converted into an single sh file, and you can reproduce your installation by just executing them.

This is simple example, which installs linux.

```luau

Package 'linux'

    :Finalize()
    :Compile()

--[[
> cat out.sh
pacman -S linux
]]

```

# Install helper

Ququ will provide GUI or TUI based install helper and ISO packing method. You can simply install arch and duplicate your arch. Install helper will provides these features: Partition, Packstrap, Time sync, Locale gen, Boot manager (Grub), Keyboard layout selector

