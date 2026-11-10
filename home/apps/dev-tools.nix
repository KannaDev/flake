{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Hazel T";
      user.email = "hazel@hazie.uk";
    };
    signing = {
      key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZnyiQx+k1ygX8E1lsUCB6aTdMc+OKzlZ4admlzknc5ulj0YrtUyqhbNhkNd6pP0QDBFMnXO/rzUvHp4TAyZXKFfpcBCa4zhK97ufymAfvzAjM4vRBqRNcr2n+2iRzxtolbklfjs3ocBQVxXW+pRT5wWxTgK2fcmP2xviDVldr7qte37x5YkQb5SAhYNH8tqJRnuGPe+Q0A3oN4HyHZFnrMq/HlbL5yg/0VKPTtF/IgHf+2dDz5OQQpBx3/N9u/QLwuIm9lkyOG03s0TGmE7up/i0jX2vIqp2BbGSnwdQEL/eSVZx73qQB/J62VFafg13P5yQWDJ33WSoiwhac6bg26HPmPOnCJp5R3c+7jM8N1F1ZbtsKicHSVsRg1RQSree4lchPy7FOPkCuUrB7LNE71mbpOzZNR767S6UAPaXxRw6QNYGBaDqQBwhlU8ZDF5F7EW6ahSUMOI6ECyoibzIMb56xs9osuNeUhB/BcL5sHSFpJjIbdcDLNkEKggrBl6s=";
      format = "ssh";
      signer = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      signByDefault = true;
    };
  };
  programs.btop = {
    enable = true;
  };

  programs.ripgrep = {
    enable = true;
  };

  programs.fd = {
    enable = true;
  };

  programs.jq = {
    enable = true;
  };
  programs.fastfetch = {
    enable = true;
  };
}
