FROM gitea/gitea
#RUN git clone --depth 1 https://github.com/thinstation/thinstation thinstation-6.2-Stable
RUN wget https://github.com/Thinstation/thinstation/archive/6.2-Stable.tar.gz -O 6.2-Stable.tar.gz
RUN tar -xf 6.2-Stable.tar.gz
RUN wget https://leidos.com/interactives/Secureboot/Leidos-UEFI-CA.cer -O thinstation-6.2-Stable/ts/ports/components/shim/UEFI-CA.cer
RUN echo -e "shim.leidos,1,Leidos,shim,15.4,donald.cupp@leidos.com\n" > thinstation-6.2-Stable/ts/ports/components/shim/BOOTX64.csv
RUN mkdir -p thinstation-6.2-Stable/dev
RUN dd if=/dev/zero of=/thinstation-6.2-Stable/dev/zero bs=2M count=1
WORKDIR thinstation-6.2-Stable
RUN ./setup-chroot -i
RUN ./setup-chroot -e prt-get update -fr shim -im -if -is |tee shim-build.log
RUN ./setup-chroot -e objdump -j .sbat -s /usr/share/shim/15.4/x64/shimx64.efi | tee -a shim-build.log
CMD ./setup-chroot
