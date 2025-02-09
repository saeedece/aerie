{
  ...
}:
{
  programs.helix = {
    enable = true;
    languages = {
      language = [
        {
          name = "haskell";
          formatter = {
            command = "ormolu";
            args = [
              "--mode"
              "inplace"
            ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }
        {
          name = "python";
          language-servers = [
            "basedpyright"
            "ruff"
          ];
          formatter = {
            command = "ruff";
            args = [
              "format"
              "--quiet"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "rust";
          formatter = {
            command = "rustfmt";
          };
          auto-format = true;
        }
        {
          name = "typst";
          formatter = {
            command = "typstyle";
            args = [ "-i" ];
          };
          auto-format = true;
        }
        {
          name = "cpp";
          file-types = [
            "cpp"
            "cc"
            "cxx"
            "hpp"
            "hcc"
            "hxx"
            "cu"
            "cuh"
          ];
          formatter.command = "clang-format";
          auto-format = true;
        }

      ];
      language-server.ruff = {
        command = "ruff-lsp";
      };
      language-server.ruff.config.settings = {
        args = [
          "--ignore"
          "E501"
        ];
      };
    };
    settings = {
      theme = "modus_operandi";
      editor = {
        color-modes = true;
        cursorline = true;
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        soft-wrap.enable = true;
        true-color = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = true;
          git-ignore = true;
        };

        indent-guides = {
          render = true;
        };

        inline-diagnostics = {
          cursor-line = "warning";
        };
      };
    };
  };
}
