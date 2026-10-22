#!/usr/bin/env bash
# Installs the lab toolchain. Tested target: Fedora; also works on Debian/Ubuntu and macOS (Homebrew).
# System packages come from the distro; CLI tools come from mise using tools/versions.env.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck disable=SC1091
source "${REPO_ROOT}/tools/versions.env"

install_system_packages() {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    if ! command -v brew >/dev/null 2>&1; then
      echo "Homebrew is required on macOS. Install it from https://brew.sh and re-run." >&2
      exit 1
    fi
    brew install git make curl jq podman python shellcheck yamllint mise
  elif command -v dnf >/dev/null 2>&1; then
    local pkgs=(git make curl jq podman python3 python3-pip shellcheck yamllint)
    # podman-docker provides a "docker" shim and conflicts with Docker CE.
    # Only add it when no docker CLI is installed already.
    if ! command -v docker >/dev/null 2>&1; then
      pkgs+=(podman-docker)
    fi
    sudo dnf install -y "${pkgs[@]}"
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y git make curl jq podman python3 python3-pip shellcheck yamllint
  else
    echo "Unsupported package manager. Install git, make, curl, jq, podman, python3 manually." >&2
  fi
}

install_mise() {
  if ! command -v mise >/dev/null 2>&1; then
    curl -fsSL https://mise.run | sh
    export PATH="${HOME}/.local/bin:${PATH}"
  fi
}

install_tools() {
  mise use --global \
    "kubectl@${KUBECTL_VERSION}" \
    "kind@${KIND_VERSION}" \
    "helm@${HELM_VERSION}" \
    "terraform@${TERRAFORM_VERSION}" \
    "k9s@${K9S_VERSION}" \
    "argocd@${ARGOCD_VERSION}" \
    "flux2@${FLUX2_VERSION}" \
    "yq@${YQ_VERSION}" \
    "go@${GO_VERSION}"
}

install_system_packages
install_mise
install_tools

echo
echo "Done. Open a new shell (or run: eval \"\$(mise activate \$(basename \"\$SHELL\"))\") and check:"
echo "  kubectl version --client && kind version && helm version && terraform version"
