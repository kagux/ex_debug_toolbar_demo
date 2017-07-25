#### FROM DOCKERHUB WITH UPDATE TO OTP:20 ####
FROM erlang:latest

# elixir expects utf8.
ENV ELIXIR_VERSION="v1.4.5" \
	LANG=C.UTF-8

RUN set -xe \
	&& ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip" \
	&& ELIXIR_DOWNLOAD_SHA256="a740e634e3c68b1477e16d75a0fd400237a46c62ceb5d04551dbc46093a03f98"\
	&& buildDeps=' \
		unzip \
	' \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends $buildDeps \
	&& curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL \
	&& echo "$ELIXIR_DOWNLOAD_SHA256 elixir-precompiled.zip" | sha256sum -c - \
	&& unzip -d /usr/local elixir-precompiled.zip \
	&& rm elixir-precompiled.zip \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& rm -rf /var/lib/apt/lists/*

CMD ["iex"]
#### END DOCKERHUB ########

MAINTAINER Boris Mikhaylov

ENV PHOENIX_VERSION 1.2.1

# install Node.js (>= 5.0.0) and NPM in order to satisfy brunch.io dependencies
# See http://www.phoenixframework.org/docs/installation#section-node-js-5-0-0-
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
 && apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update \
 && apt-get install yarn

# Install neovim
# https://github.com/neovim/neovim/issues/2211
RUN echo "deb http://ppa.launchpad.net/neovim-ppa/unstable/ubuntu vivid main" >> /etc/apt/sources.list \
 && apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 55F96FCF8231B6DD \
 && apt-get update \
 && apt-get install -y neovim \
 && apt-get install -y python python-dev python-pip python3-dev python3-pip \
 && pip3 install neovim \
 && nvim -es -c ":UpdateRemotePlugins" -c 'qa!' \
 && update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 \
 && update-alternatives --config vi \
 && update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 \
 && update-alternatives --config vim \
 && update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 \
 && update-alternatives --config editor

# Install backups commands
RUN apt-get install -y postgresql-client \
 && pip install awscli

# install ssh server
RUN apt-get install -y openssh-server \
    && ssh-keygen -A \
    && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config \
    && echo "root:pass" | chpasswd

RUN apt-get install -y dnsutils inotify-tools

# Install Zsh
RUN apt-get install -y zsh

RUN groupadd dev && useradd -ms /bin/zsh -g dev dev

#install gosu
ENV GOSU_VERSION 1.7
RUN set -x \
	&& wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
	&& wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
	&& export GNUPGHOME="$(mktemp -d)" \
	&& gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
	&& rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
  && chown root:dev /usr/local/bin/gosu \
	&& chmod 6755 /usr/local/bin/gosu \
	&& gosu nobody true

# Install sass
RUN apt-get install -y ruby ruby-dev && gem install sass

USER dev

RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Fuzzy history utility
ENV FZF_VERSION 0.13.2
RUN git clone https://github.com/junegunn/fzf.git /home/dev/.fzf \
    && (cd /home/dev/.fzf && git checkout ${FZF_VERSION}) \
    && (yes | /home/dev/.fzf/install)

WORKDIR /app

RUN mix local.hex --force
RUN mix local.rebar --force

# ENV SHELL /user/bin/zsh

CMD ["/usr/bin/zsh"]
