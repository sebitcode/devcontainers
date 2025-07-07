FROM python:3.12-slim
ENV DEBIAN_FRONTEND=noninteractive
# Install dependencies (optimized single layer)
RUN apt-get update && apt-get install -y --no-install-recommends \
    # zsh curl git fonts-powerline fonts-font-awesome fonts-noto-color-emoji build-essential locales \
    zsh curl git fonts-powerline locales \
    # Cleanup in same layer
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    # Generate locales
    && locale-gen en_US.UTF-8
# RUN apk add freetype-dev postgresql-dev gcc musl-dev git

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# Install Powerlevel10k theme
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Install useful plugins
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions \
    && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting \
    && git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
# Install modern CLI tools (combined into fewer layers)
RUN curl -sS https://starship.rs/install.sh | sh -s -- -y \
    && curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb \
    && dpkg -i ripgrep_13.0.0_amd64.deb \
    && rm ripgrep_13.0.0_amd64.deb \
    && curl -L https://github.com/sharkdp/fd/releases/download/v8.7.0/fd_8.7.0_amd64.deb -o fd.deb \
    && dpkg -i fd.deb \
    && rm fd.deb \
    && curl -L https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb -o bat.deb \
    && dpkg -i bat.deb \
    && rm bat.deb

# Create config directory for starship
RUN mkdir -p /root/.config
# Set zsh as default shell
RUN chsh -s $(which zsh)
# Copy configuration files
COPY .zshrc /root/.zshrc
COPY .p10k.zsh /root/.p10k.zsh
COPY starship.toml /root/.config/starship.toml

# Set default shell to zsh for better experience
SHELL ["/bin/zsh", "-c"]