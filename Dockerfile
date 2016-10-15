FROM bioconductor/release_core

MAINTAINER miura.t@gmail.com

# Change environment to Japanese(Character and DateTime)
ENV \
	LANG=ja_JP.UTF-8 \
	LC_ALL=ja_JP.UTF-8
RUN sed -i '$d' /etc/locale.gen \
  && echo "ja_JP.UTF-8 UTF-8" >> /etc/locale.gen \
	&& locale-gen ja_JP.UTF-8 \
	&& /usr/sbin/update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
RUN /bin/bash -c "source /etc/default/locale"
RUN ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

ADD installBiocPkg.R /tmp/

# invalidates cache every 24 hours
ADD http://master.bioconductor.org/todays-date /tmp/


RUN R -f /tmp/installBiocPkg.R
