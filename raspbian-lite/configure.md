# Configure server installs

These are things that I like to do to set up my server.

1. Clone bash_scripts repo (this repo).
1. Install the scripts etc. `bash_scripts/install.sh raspbian-lite`
1. Install the apps I like to use `bash_scripts/server-installs/all.sh`

## VirtualBox

### Sharing folders and USB

On the host PC, make sure that you are a member of the `vboxusers` group:

```bash
$ id
uid=1000(andy) gid=1000(andy) groups=1000(andy),4(adm),20(dialout),24(cdrom),
27(sudo),30(dip),46(plugdev),116(lpadmin),126(sambashare),129(vboxusers),
500(nasall),998(lxd),999(docker)
```

If not, add yourself using:

```bash
sudo adduser ${USER} vboxusers
```

Shared folders should now work.

For USB, you also need to install the extension pack.  This is an extra
package that has to be downloaded and installed manually.  See:
<https://www.virtualbox.org/wiki/Downloads> for details.

### VT-x work around

This is a work around for the greyed out VT-x check box.  Check your CPU has VT-x enabled:

```bash
cat /proc/cpuinfo | grep vmx
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid xsaveopt dtherm ida arat pln pts md_clear flush_l1d
```

To enable VT-x:
`VBoxManage modifyvm 'Kubuntu18.04LTS ROS2 Install' --nested-hw-virt on`
The quoted string is the name of the VM.
