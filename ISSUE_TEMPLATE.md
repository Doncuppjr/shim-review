Make sure you have provided the following information:

 - [x] link to your code branch cloned from rhboot/shim-review in the form user/repo@tag
https://www.github.com/doncuppjr/shim-review@Leidos-shim-x64-20210311
 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added do vendor_db ( if you use vendor_db and have hashes whitelisted )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs


###### What organization or people are asking to have this signed:
`Leidos, Inc.`

###### What product or service is this for:
`TENS Public`

###### What is the origin and full version number of your shim?
`https://www.github.com/rhboot/shim.git` 15.3

###### What's the justification that this really does need to be signed for the whole world to be able to boot it:
`We build a custom kernel and don't want to walk users through key enrollment`

###### How do you manage and protect the keys used in your SHIM?
`AES 256 Key`

###### Do you use EV certificates as embedded certificates in the SHIM?
`No`

###### If you use new vendor_db functionality, are any hashes whitelisted, and if yes: for what binaries ?
`N/A`

###### Is kernel upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 present in your kernel, if you boot chain includes a linux kernel ?
`Yes`

###### if SHIM is loading grub2 bootloader, is CVE CVE-2020-10713 fixed ?
`Yes`

##### Did you change your certificate strategy, so that affected by CVE CVE-2020-10713 grub2 bootloaders can not be verified ?
`N/A, We didn't sign those bootloaders`

###### What is the origin and full version number of your bootloader (GRUB or other)?
`http://ftp.gnu.org/gnu/grub/grub-$version.tar.xz 2.04 with Fedora Raw Hide Patches 0001-0301`

###### If your SHIM launches any other components, please provide further details on what is launched
`Only mmx.efi and fbx.efi which are part of shim package`

###### How do the launched components prevent execution of unauthenticated code?
`shim checks grub2 signature, grub2 checks kernel signature, kernel checks module signatures`

###### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
`No`

###### What kernel are you using? Which patches does it includes to enforce Secure Boot?
`5.4.98, all secure boot patches should be applied`

###### What changes were made since your SHIM was last signed?
`N/A, New Vendor`

###### What is the hash of your final SHIM binary?
`6e3f827d4cfc27bcf9c26136cf09076eb930ea9abb06346b1fcad1cd3c479846`
