FROM alpine:3.22
RUN apk add sudo curl neovim neovim-doc tree-sitter-vimdoc ripgrep xclip && addgroup -S sudo && adduser -D -u 1000 siuyin sudo && echo "siuyin ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/siuyin
USER siuyin
WORKDIR /home/siuyin
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && . .profile && uv tool install ruff@latest && uv tool install ty@latest
COPY --chown=siuyin:siuyin .config/nvim/init.lua .config/nvim/init.lua
ENTRYPOINT ["sh","--login"]
