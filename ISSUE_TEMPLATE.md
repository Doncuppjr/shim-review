Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
 - [x] completed README.md file with the necessary information
`https://raw.githubusercontent.com/Doncuppjr/shim-review/master/README.md`
 - [x] shim.efi to be signed
`https://raw.githubusercontent.com/Doncuppjr/shim-review/master/shimx64.efi`
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
`https://raw.githubusercontent.com/Doncuppjr/shim-review/master/Leidos-UEFI-CA.cer`
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes allow-listed )
`N/A`
 - [x] any extra patches to shim via your own git tree or as files
`https://github.com/Thinstation/thinstation/tree/6.2-Stable/ts/ports/components/shim`
 - [x] any extra patches to grub via your own git tree or as files
`https://github.com/Thinstation/thinstation/tree/6.2-Stable/ts/ports/opt/grub2-efi`
 - [x] build logs
`https://raw.githubusercontent.com/Doncuppjr/shim-review/master/shim-build.log`

###### What organization or people are asking to have this signed:
`Leidos, Inc.`

###### What product or service is this for:
`TENS Public`

###### Please create your shim binaries starting with the 15.3 shim release tar file:
###### https://github.com/rhboot/shim/releases/download/15.3/shim-15.3.tar.bz2
###### This matches https://github.com/rhboot/shim/releases/tag/15.3 and contains
###### the appropriate gnu-efi source.
###### Please confirm this as the origin your shim.
`https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2` 15.4

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
`We build a custom kernel and don't want to walk users through key enrollment`

###### How do you manage and protect the keys used in your SHIM?
`The CA is stored on a DATASHUR PRO2 hardware encryption key. The signing key is stored an a Taglio C980 SmartCard. Both are located in a secure storage area.`

###### Do you use EV certificates as embedded certificates in the SHIM?
`No`

###### If you use new vendor_db functionality, are any hashes allow-listed, and if yes: for what binaries ?
`No`

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a Linux kernel ?
`Yes`

###### if SHIM is loading GRUB2 bootloader, are CVEs CVE-2020-14372,
###### CVE-2020-25632, CVE-2020-25647, CVE-2020-27749, CVE-2020-27779,
###### CVE-2021-20225, CVE-2021-20233, CVE-2020-10713, CVE-2020-14308,
###### CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
###### ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
###### and if you are shipping the shim_lock module CVE-2021-3418
###### fixed ?
`Yes`

###### "Please specifically confirm that you add a vendor specific SBAT entry for SBAT header in each binary that supports SBAT metadata
###### ( grub2, fwupd, fwupdate, shim + all child shim binaries )" to shim review doc ?
###### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim
`Shim looks like  
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md  
shim,1,UEFI shim,shim,1,https://github.com/rhboot/shim  
shimx64.efi,1,Leidos,shim,15.4,donald.cupp@leidos.com  
`
`Grub looks like  
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md  
grub,1,Free Software Foundation,grub,2.06-rc1,https//www.gnu.org/software/grub/  
grub.leidos,1,Leidos,grub,2.06-rc1-1,donald.cupp@leidos.com  
`
`Linux looks like  
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md  
linux,1,The Linux Foundation,linux,5.4.108,https://www.kernel.org/  
vmlinuz,1,Leidos,linux,5.4.108,donald.cupp@leidos.com  
`

##### Were your old SHIM hashes provided to Microsoft ?
`N/A New Vendor`

##### Did you change your certificate strategy, so that affected by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
##### CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
##### CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705 ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
##### grub2 bootloaders can not be verified ?
`N/A New Vendor, never signed those.`

##### What exact implementation of Secureboot in grub2 ( if this is your bootloader ) you have ?
##### * Upstream grub2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
`I am using the Fedora recipe.`

###### What is the origin and full version number of your bootloader (GRUB or other)?
`https://git.savannah.gnu.org/cgit/grub.git/snapshot/grub-$version.tar.gz 2.06-rc1 Fedora patches 0001 - 0196`

###### If your SHIM launches any other components, please provide further details on what is launched
`Just GRUB2 fbx64.efi and mmx64.efi`

###### If your GRUB2 launches any other binaries that are not Linux kernel in SecureBoot mode,
###### please provide further details on what is launched and how it enforces Secureboot lockdown
`N/A we only do Linux`

###### If you are re-using a previously used (CA) certificate, you
###### will need to add the hashes of the previous GRUB2 binaries
###### exposed to the CVEs to vendor_dbx in shim in order to prevent
###### GRUB2 from being able to chainload those older GRUB2 binaries. If
###### you are changing to a new (CA) certificate, this does not
###### apply. Please describe your strategy.
`N/A`

###### How do the launched components prevent execution of unauthenticated code?
`Shim verifies GRUB, GRUB verifies kernel, kernel verifies modules.`

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
`No`

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
`5.4.108, all secureboot patches should be applied`

###### What changes were made since your SHIM was last signed?
`N/A`

###### What is the SHA256 hash of your final SHIM binary?
`eb1f011e62bf8bdf86ce3c7c8eb1beff74e810c322c97ceeda31b46ca6704c5e`

