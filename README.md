This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using grub2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
Leidos, Inc.

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
TENS Public

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
We produce a 'LiveCD' to be used as a remote access and emergency access terminal, while also being certified by DISA. Wherever applicable, FIPS standards are applied, and all STIG's are implemented. The focus of the distribution is to provide a verifiable known state on BYOE devices that is secure when running and leaves no residue. We necessarily must compile our own kernel to achieve all of these objectives, and would like a signed shim, so we don't need to enroll keys or change the contents of firmware in any way. We provide the image to the public as well as the source code, should anybody want to use our build or make their own, but we don't distribute keys.

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Donald A. Cupp Jr.
- Position: Systems Developer
- Email address: donald.cupp@leidos.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
73D044E65F294ED8DD442A5D6FCBC4DEA325935D
-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name: Michael J. Kenny
- Position: Software Engineer
- Email address: michael.j.kenny@leidos.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the linux community:
5E158647E1B0F56D1C674160A7D7A7B662427523
-------------------------------------------------------------------------------
What upstream shim tag is this starting from:
-------------------------------------------------------------------------------
15.4

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
https://github.com/Thinstation/thinstation/blob/6.2-Stable/ts/ports/components/shim/Pkgfile

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
None

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2: is CVE-2020-10713 fixed ?
-------------------------------------------------------------------------------
Yes

-------------------------------------------------------------------------------
If bootloader, shim loading is, grub2, and previous shims were trusting affected
by CVE-2020-10713 grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-10713,
  grub2 builds ?
-------------------------------------------------------------------------------
N/A

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
Yes. We prohibit all efivar writes and we also set
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY=y


-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are whitelisted hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
N/A

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and the differences would be.
-------------------------------------------------------------------------------

https://www.github.com/doncuppjr/shim-review/Dockerfile

gcc, 10.2.0, https://github.com/Thinstation/thinstation/tree/6.2-Stable/ts/ports/core/gcc  
binutils, 2.32, https://github.com/Thinstation/thinstation/tree/6.2-Stable/ts/ports/core/binutils  
gnu-efi, 3.0.13, https://github.com/Thinstation/thinstation/tree/6.2-Stable/ts/ports/opt/gnu-efi  

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
shim-build.log

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
The ThinStation image building system was designed back in the days of chroot containers.  
It places an emphasis on making it easy for realatively inexperienced techs to make very sercure  
Thinclients. It really simplifies a lot of the structures most distros use into a single git  
checkout. Most of the time that works for us, but docker don't like it much, but I made it work.
