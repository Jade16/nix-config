{ config, lib, pkgs, ... }:

lib.mkIf config.programs.neovim.enable {


  # Define o Neovim como editor padrão para o usuário
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  programs.neovim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
      confirm = true;
      shiftwidth = 2;
      expandtab = true;
      softtabstop = 0;
      tabstop = 2;
      undofile = false;
      smartcase = true;
      ignorecase = true;
      colorcolumn = "80";
      foldmethod = "indent";
      foldlevelstart = 10;
    };

    globals = {mapleader = " ";};

    keymaps = [
    {
      key = "<C-d>";
      action = "<C-d>zz";
      options.noremap = true;
      options.desc = "Half page down";
    }
    {
      key = "<C-u>";
      action = "<C-u>zz";
      options.noremap = true;
      options.desc = "Half page up";
    }
    {
      key = "n";
      action = "nzz";
      options.noremap = true;
      options.desc = "Next item";
    }
    {
      key = "N";
      action = "Nzz";
      options.noremap = true;
      options.desc = "Prev item";
    }
    {
      key = "{<CR>";
      action = "{<CR>}<ESC>O";
      mode = ["i"];
      options.noremap = true;
    }
    {
      key = "<Leader>s";
      action = "<cmd>%s/\\s\\+$/<CR>";
      options.noremap = true;
      options.desc = "Remove dangling whitespaces";
    }
    {
      key = "<Leader>d";
      action = ''"+d'';
      mode = ["n" "v"];
      options.noremap = true;
      options.desc = "Delete and put contents in system clipboard";
    }
    {
      key = "<Leader>c";
      action = ''"+c'';
      mode = ["n" "v"];
      options.noremap = true;
      options.desc = "Cut and put contents in system clipboard";
    }
    {
      key = "p";
      action = ''"+P'';
      mode = ["n" "v"];
      options.noremap = true;
      options.desc = "Paste and throw away highlighted contents";
    }
    {
      key = "y";
      action = ''"+y'';
      mode = ["n" "v"];
      options.noremap = true;
      options.desc = "Yank contents to system clipboard";
    }
    {
      key = "<Tab>";
      action = "<cmd>bn<CR>";
      options.noremap = true;
      options.desc = "Buffer next";
    }
    {
      key = "<S-Tab>";
      action = "<cmd>bp<CR>";
      options.noremap = true;
      options.desc = "Buffer prev";
    }
    {
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.noremap = true;
      mode = ["v"];
    }
    {
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.noremap = true;
      mode = ["v"];
    }
    {
      key = "<Leader>x";
      action = "<cmd>bd<CR>";
      options.noremap = true;
      options.desc = "Buffer delete";
    }
    {
      key = "<Leader>ff";
      action = "<cmd> Telescope find_files <CR>";
      options.noremap = true;
      options.desc = "Fuzzy find files";
    }
    {
      key = "<Leader>fg";
      action = "<cmd> Telescope live_grep <CR>";
      options.noremap = true;
      options.desc = "Live Grep";
    }
    {
      key = "<Leader>ft";
      action = "<cmd> NvimTreeToggle <CR>";
      options.noremap = true;
      options.desc = "Toggle NvimTree";
    }
    {
      key = "<Leader>fu";
      action = "<cmd> UndotreeToggle <CR><cmd> UndotreeFocus <CR>";
      options.noremap = true;
      options.desc = "Toggle UndoTree";
    }
    {
      key = "<Leader>ga";
      action = "<cmd> Gitsigns stage_hunk <CR>";
      options.noremap = true;
      options.desc = "Git add hunk";
      mode = ["n" "v"];
    }
    {
      key = "<Leader>gu";
      action = "<cmd> Gitsigns undo_stage_hunk <CR>";
      options.noremap = true;
      options.desc = "Git undo add";
    }
    {
      key = "<Leader>gd";
      action = "<cmd> Gitsigns diffthis <CR>";
      options.noremap = true;
      options.desc = "Git diff";
    }
    {
      key = "<Leader>gn";
      action = "<cmd> Gitsigns next_hunk <CR>zz";
      options.noremap = true;
      options.desc = "Git next hunk";
    }
    {
      key = "<Leader>gp";
      action = "<cmd> Gitsigns prev_hunk <CR>zz";
      options.noremap = true;
      options.desc = "Git prev hunk";
    }
    {
      key = "<Leader>gb";
      action = "<cmd> Gitsigns blame_line <CR>";
      options.noremap = true;
      options.desc = "Git blame line";
    }
    {
      key = "<C-f>";
      action = "<cmd> lua vim.lsp.buf.format() <CR>";
      options.noremap = true;
      options.desc = "LSP format";
    }
    {
      key = "gd";
      action = "<cmd> lua vim.lsp.buf.definition() <CR>";
      options.noremap = true;
      options.desc = "LSP definition";
    }
    {
      key = "gc";
      action = "<cmd> lua vim.lsp.buf.declaration() <CR>";
      options.noremap = true;
      options.desc = "LSP declaration";
    }
    {
      key = "gr";
      action = "<cmd> lua vim.lsp.buf.references() <CR>";
      options.noremap = true;
      options.desc = "LSP references";
    }
    {
      key = "K";
      action = "<cmd> lua vim.lsp.buf.hover() <CR>";
      options.noremap = true;
      options.desc = "LSP hover";
      mode = ["n"];
    }
    {
      key = "<C-h>";
      action = "<cmd> lua vim.lsp.buf.signature_help() <CR>";
      options.noremap = true;
      options.desc = "LSP signature help";
      mode = ["i"];
    }
    {
      key = "<Leader>la";
      action = "<cmd> lua vim.lsp.buf.code_action() <CR>";
      options.noremap = true;
      options.desc = "LSP code action";
    }
    {
      key = "<Leader>ln";
      action = "<cmd> lua vim.lsp.buf.rename() <CR>";
      options.noremap = true;
      options.desc = "LSP rename";
    }
    ];

    colorschemes.catppuccin = {
      enable = true;
        settings = {
          term_colors = true;
          flavour = "mocha";
          transparent_background = true;
        };
    };

    plugins.web-devicons.enable = true;

    plugins = {
      tmux-navigator.enable = true;
      lualine.enable = true;
      bufferline.enable = true;
      which-key.enable = true;
      telescope.enable = true;
      undotree.enable = true;
      gitsigns.enable = true;
      nvim-tree.enable = true;
      luasnip.enable = true;
      treesitter-context = {
        enable = true;
        settings.on_attach = ''
          function(buf)
            vim.api.nvim_set_hl(
              0,
                'TreesitterContextBottom',
                { underline=true, fg="darkgrey", bg="none" }
            )
            vim.api.nvim_set_hl(
              0,
              'TreesitterContext',
              { bg="none" }
            )
            return true
          end
        '';
      };
      treesitter = {
        enable = true;
          settings.ensure_installed = [
            "c"
            "cpp"
            "go"
            "gomod"
            "gosum"
            "python"
            "lua"
            "nix"
            "bash"
            "dockerfile"
            "markdown"
            "json"
            "yaml"
          ];
      };
      lsp = {
        enable = true;
        servers = {
          clangd.enable = true;
          ruff.enable = true;
          pyright.enable = true;
        };

        onAttach = ''
          vim.api.nvim_set_hl(
            0,
            'NormalFloat',
            { bg="#313244" }
          )
        '';
      };
      # java
      #nvim-jdtls = {
      jdtls = {
        enable = true;
        settings.settings = { 
          cmd = [
            "-configuration"
            "${config.xdg.cacheHome}/jdtls/config"
            "-data"
            "${config.xdg.cacheHome}/jdtls/workspace" 
          ];
        };
        #data = "${config.xdg.cacheHome}/jdtls/workspace";
        #configuration = "${config.xdg.cacheHome}/jdtls/config";
      };
      copilot-chat.enable = true;
      copilot-cmp.enable = true;
      copilot-lua = {
        enable = true;
        settings = {
          panel.enabled = false;
          suggestion.enabled = false;
        };
      };
      cmp = {
        enable = true;
        settings = {
          sources = [
            {name = "copilot";}
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "buffer";}
            {name = "luasnip";}
          ];

          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-Tab>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip == nil then
                  fallback()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
            "<Tab>" = ''
              function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip == nil then
                  fallback()
                elseif luasnip.expandable() then
                  luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                elseif check_backspace() then
                  fallback()
                else
                  fallback()
                end
              end
            '';
          };

          snippet.expand = ''
            function(args)
              require('luasnip').lsp_expand(args.body)
            end
          '';
        };
      };
    };

    # desabilita do copilot por padrao
    #autoCmd = [
    #{
      #command = "Copilot disable";
      #event = [
        #"VimEnter"
      #];
    #} 
    #];
  };
}
