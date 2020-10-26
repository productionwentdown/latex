FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

#
# Install packages
#

RUN echo "deb http://deb.debian.org/debian bullseye contrib non-free" >> /etc/apt/sources.list
RUN apt-get update \
	&& apt-get install -y \
		texlive \
		texlive-games \
		texlive-humanities \
		texlive-music \
		texlive-pictures \
		texlive-publishers \
		texlive-science \
		texlive-xetex \
		\
		texlive-lang-english \
		texlive-lang-chinese \
		texlive-lang-german \
		\
		fonts-opendyslexic \
		fonts-noto-core \
		fonts-noto-mono \
		fonts-noto-cjk \
		fonts-noto-color-emoji \
		fonts-roboto \
		fonts-roboto-slab \
		fonts-open-sans \
		fonts-cardo \
		fonts-font-awesome \
		fonts-inter \
		fonts-lato \
		fonts-firacode \
		fonts-ibm-plex \
		fonts-ubuntu \
		\
		make \
		curl wget \
		gnuplot \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

#
# Other packages
#

# Fonts
#
# lexlive-fonts-extra
# fonts-liberation2
# ttf-mscorefonts-installer

#
# Prepare any required CPAN packages
#

RUN tlmgr init-usertree
# RUN tlmgr install latexmk

#
# Copy in helpers
#
COPY bin/* /usr/local/bin/
