# Start with Debian Stretch
FROM debian:stretch-slim

# Set the Netatalk version
ENV NETATALK_VERSION 3.1.12

# Set noninteractive mode (no prompts, accept defaults everywhere)
ENV DEBIAN_FRONTEND=noninteractive

# Follow the instructions from here: http://netatalk.sourceforge.net/wiki/index.php/Install_Netatalk_3.1.12_on_Debian_9_Stretch
RUN apt-get update \
    && apt-get install \
      --no-install-recommends \
      --fix-missing \
      --assume-yes \
      build-essential \
      libio-socket-inet6-perl \
      tracker \
      avahi-daemon \
      libevent-dev \
      libssl-dev \
      libgcrypt-dev \
      libkrb5-dev \
      libpam0g-dev \
      libwrap0-dev \
      libdb-dev \
      libtdb-dev \
      libmariadbclient-dev \
      libavahi-client-dev \
      libacl1-dev \
      libldap2-dev \
      libcrack2-dev \
      systemtap-sdt-dev \
      libdbus-1-dev \
      libdbus-glib-1-dev \
      libglib2.0-dev \
      libtracker-sparql-1.0-dev \
      libtracker-miner-1.0-dev \
      ca-certificates \
      curl \
    && curl -SL  "https://downloads.sourceforge.net/project/netatalk/netatalk/${NETATALK_VERSION}/netatalk-${NETATALK_VERSION}.tar.gz" | tar xvz

# Change to the source code directory
WORKDIR netatalk-${NETATALK_VERSION}

# Configure make and build
RUN ./configure \
          --with-init-style=debian-systemd \
          --without-libevent \
          --without-tdb \
          --with-cracklib \
          --enable-krbV-uam \
          --with-pam-confdir=/etc/pam.d \
          --with-dbus-daemon=/usr/bin/dbus-daemon \
          --with-dbus-sysconf-dir=/etc/dbus-1/system.d \
          --with-tracker-pkgconfig-version=1.0 \
        &&  make \
        &&  make install \
        &&  apt-get --quiet --yes purge --auto-remove \
                build-essential \
                ca-certificates \
                curl \
        &&  apt-get --quiet --yes autoclean \
        &&  apt-get --quiet --yes autoremove \
        &&  apt-get --quiet --yes clean \
        &&  rm -rf /netatalk* \
        &&  rm -rf /usr/share/man \
        &&  rm -rf /usr/share/doc \
        &&  rm -rf /usr/share/mime \
        &&  rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY afp.conf /usr/local/etc/afp.conf
ENV DEBIAN_FRONTEND=newt

CMD ["/docker-entrypoint.sh"]
