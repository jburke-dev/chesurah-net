{
  perSystem =
    {
      config,
      self',
      inputs',
      pkgs,
      ...
    }:
    {
      pre-commit = {
        settings.hooks = {
          statix.enable = true;
          commitizen.enable = true;
          nixfmt.enable = true;
          ansible-lint.enable = true;
          markdownlint = {
            enable = true;
            settings.configuration = {
              line-length = false;
            };
          };
        };
        check.enable = true;
      };
      devShells.default = pkgs.mkShell {
        shellHook = ''
          ${config.pre-commit.installationScript}
        '';

        packages = config.pre-commit.settings.enabledPackages ++ [ pkgs.python3 ];
      };
    };
}
