<h1 align="center">
construct-plymouth
</h1>
<p align="center">
A Plymouth theme intented to be used in conjunction with construct-grub.
</p>

---
# Installation
- Install `plymouth` from your distro's package manager. If you're experiencing any issues with this (especially on Arch), try installing `plymouth-git` instead from the AUR.
- Depending on your distro, you'll have some configuration work to do at this point. The [Arch Wiki : Plymouth page](https://wiki.archlinux.org/title/Plymouth) is a good place to look.
- Clone the repo `git clone https://github.com/Olocool17/construct-plymouth`
- Go into the repo directory `cd construct-plymouth`
- Run the installation script `sudo ./install.sh`
### Flickerless GRUB transition
By far the greatest difficulty in making this theme work well with construct-grub is the elimination of any possible flickering during the transition from GRUB to Plymouth.

- The kernel parameter `vt.global_cursor_default=0` will disable the cursor in Plymouth.
- The kernel paramaters `quiet loglevel=3` will suppress any messages printed to the console.

Aside from these settings, it greatly depends on your hardware. Intel users should look into enabling fastboot (on by default on newer systems, Skylake and up)

I personally didn't get a completely flickerless boot scenario to work on my machine, most likely because of older hardware (Intel Haswell), which means I cannot guarantee that the transition between construct-grub and construct-plymouth is fully seamless.
If someone with a flickerless boot experience does notice a problem with the transition between the two themes, please make an issue on this repo.
