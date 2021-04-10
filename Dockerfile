FROM doncuppjr/thinstation:latest
ENV PATH=/ts/bin:$PATH
RUN wget https://leidos.com/interactives/Secureboot/Leidos-UEFI-CA.cer -O ts/ports/components/shim/UEFI-CA.cer
RUN echo -e "shimx64.efi,1,Leidos,shim,15.4,donald.cupp@leidos.com\n" > ts/ports/components/shim/BOOTX64.csv
RUN prt-get update -fr shim -im -if -is |tee shim-build.log
