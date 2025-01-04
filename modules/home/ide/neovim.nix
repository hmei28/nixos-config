{ inputs, pkgs, ... }:  {

  programs.neovim = {
    enable = true;
    defaultEditor = true; 
    vimAlias = true;
    viAlias = true;

    withPython3 = true;
    plugins = with pkgs.vimPlugins; [
      LazyVim
      # Completion & LSP
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp

      # Syntax highlighting
      nvim-treesitter

      # Fuzzy finder
      telescope-nvim

    ];

    initLua = ''
      -- Numéros de ligne relatifs
      vim.o.relativenumber = true
      vim.o.number = true

      -- Désactiver la souris
      vim.o.mouse = ""
    '';
  };
}
