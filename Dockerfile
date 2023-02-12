# XLXD
# LY3FF 2022
#
#
#

FROM debian:10

WORKDIR /opt

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential git ca-certificates apache2 php7.3 wget \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN cd /opt && git clone https://github.com/LX3JL/xlxd.git && cd /opt/xlxd/src \
 && sed -i 's/^#define RUN_AS_DAEMON/\/\/#define RUN_AS_DAEMON/' main.h \
 && make clean -j && make -j4 && make install \
 && cd /opt && wget https://ftdichip.com/wp-content/uploads/2022/07/libftd2xx-x86_64-1.4.27.tgz && tar -zxf ./libftd2xx-x86_64-1.4.27.tgz && rm ./libftd2xx-x86_64-1.4.27.tgz \
 && cd /opt/release/build && cp *so* *a /usr/lib/x86_64-linux-gnu/ && ldconfig \
 && cd /opt/xlxd/ambed && make -j && cp ./ambed /xlxd/ \
 && cd /opt/xlxd/ambedtest && make -j && cp ./ambedtest /xlxd/ \
 && cp -r /opt/xlxd/dashboard/* /var/www/html \
 && wget -O /xlxd/dmrid.dat http://xlxapi.rlx.lu/api/exportdmr.php \
 && rm -rf /opt/* /var/www/html/index.html

COPY ./entrypoint.sh /usr/local/sbin/
RUN chmod a+x /usr/local/sbin/entrypoint.sh

WORKDiR /xlxd

EXPOSE 80
EXPOSE 8080
EXPOSE 10001/udp
EXPOSE 10002/udp
EXPOSE 42000/udp
EXPOSE 30001/udp
EXPOSE 20001/udp
EXPOSE 30051/udp
EXPOSE  8880/udp
EXPOSE 62030/udp
EXPOSE 10100/udp
EXPOSE 10101-10199/udp
EXPOSE 12345-12346/udp
EXPOSE 40000/udp
EXPOSE 21110/udp


#fixme

ENTRYPOINT ["/usr/local/sbin/entrypoint.sh"]
