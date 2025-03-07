{
  config,
  lib,
  pkgs,
  ...
}:
{
  home-manager.sharedModules = [
    {
      home.packages = with pkgs; [
        markdown-oxide
        nil
        nixfmt-rfc-style
        typst
        typstyle
        tinymist
      ];

      home.sessionVariables."EDITOR" = "hx";

      programs.helix = {
        enable = true;

        settings = {
          theme = "modus_operandi";
          editor = {
            auto-completion = false;
            color-modes = true;
            cursorline = true;
            end-of-line-diagnostics = "disable";
            indent-guides.render = true;
            inline-diagnostics.cursor-line = "disable";
            line-number = "relative";
            lsp.snippets = false;
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
          };
        };

        languages = {
          language = [
            {
              name = "rust";
              formatter = {
                command = "rustfmt";
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
              formatter = {
                command = "clang-format";
              };
              auto-format = true;
            }

            {
              name = "javascript";
              shebangs = [ "deno" ];
              roots = [
                "deno.json"
                "deno.jsonc"
              ];
              file-types = [ "js" ];
              language-servers = [ "deno-lsp" ];
              auto-format = true;
            }

            {
              name = "typescript";
              shebangs = [ "deno" ];
              roots = [
                "deno.json"
                "deno.jsonc"
              ];
              file-types = [ "ts" ];
              language-servers = [ "deno-lsp" ];
              auto-format = true;
            }

            {
              name = "jsx";
              shebangs = [ "deno" ];
              roots = [
                "deno.json"
                "deno.jsonc"
              ];
              file-types = [ "jsx" ];
              language-servers = [ "deno-lsp" ];
              auto-format = true;
            }

            {
              name = "tsx";
              shebangs = [ "deno" ];
              roots = [
                "deno.json"
                "deno.jsonc"
              ];
              file-types = [ "tsx" ];
              language-servers = [ "deno-lsp" ];
              auto-format = true;
            }

            {
              name = "html";
              formatter = {
                command = "deno";
                args = [
                  "fmt"
                  "-"
                  "--ext"
                  "html"
                ];
              };
              auto-format = true;
            }

            {
              name = "css";
              formatter = {
                command = "deno";
                args = [
                  "fmt"
                  "-"
                  "--ext"
                  "css"
                ];
              };
              auto-format = true;
            }

            {
              name = "nix";
              formatter.command = "nixfmt";
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
              name = "typst";
              formatter = {
                command = "typstyle";
                args = [ "-i" ];
              };
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

          language-server.deno-lsp = {
            command = "deno";
            args = [ "lsp" ];
          };

          language-server.deno-lsp.config.deno = {
            enable = true;
            suggest = {
              completeFunctionCalls = false;
              imports.hosts."https://deno.land" = true;
            };
          };
        };
      };
    }
  ];
}
