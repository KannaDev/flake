# Flake

## Host verification

GitHub Actions discovers all exported `darwinConfigurations` and
`nixosConfigurations` on pushes and pull requests, then builds each host's system
closure without activating it. The workflow can also be started manually.
macOS hosts run on Apple Silicon macOS runners and NixOS hosts on x86-64 Linux
runners, matching the systems currently defined in the flake.

The workflow checks the commit selected by the event: the pushed tip for a push
and GitHub's merge commit for a pull request. Building a configuration does not
verify that activation or the hardware itself works.

## Automatic flake updates

The update workflow runs daily at 06:00 UTC and can also be started manually.
It updates `flake.lock`, opens or updates a pull request, and enables rebase
auto-merge. If there are no changes, it does not open a pull request.

Before enabling it:

1. Enable auto-merge and rebase merging in the repository settings.
2. Add a branch protection rule for the default branch that requires the
   `Verify all hosts` status check and enforces the rule for administrators.
   The workflow checks these settings before creating or updating a pull request.
3. Add a fine-grained personal access token as the Actions repository secret
   `FLAKE_UPDATE_TOKEN`. Give it access to this repository with **Contents** and
   **Pull requests** read and write, and **Administration** read permissions.
   Its owner must be allowed to create and merge pull requests. A separate token
   is necessary so that update pull requests trigger host verification.

Other required checks or reviews will also block auto-merge. The host checks
must pass before the update can merge; the known missing `HazelsMacBookPro`
configuration and incomplete `Hydaelyn` configuration currently prevent that.
