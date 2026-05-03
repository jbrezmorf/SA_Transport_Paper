#!/usr/bin/env bash
set -euo pipefail

# Install a TeX Live stack suitable for this repository on Linux Mint / Ubuntu.
# This mirrors the TeX packages already present in the current environment and
# adds the missing pieces needed by this project:
# - XeLaTeX/LuaLaTeX support for fontspec
# - biber for biblatex
# - Microsoft core fonts for the Arial main font used by surao.cls

if [[ "${EUID}" -eq 0 ]]; then
    SUDO=""
else
    SUDO="sudo"
fi

APT_PACKAGES=(
    biber
    fonts-lmodern
    fonts-texgyre
    fonts-texgyre-math
    lmodern
    texlive
    texlive-base
    texlive-binaries
    texlive-extra-utils
    texlive-fonts-extra
    texlive-fonts-extra-links
    texlive-fonts-recommended
    texlive-lang-czechslovak
    texlive-lang-english
    texlive-lang-european
    texlive-lang-french
    texlive-lang-german
    texlive-lang-greek
    texlive-lang-italian
    texlive-lang-polish
    texlive-lang-spanish
    texlive-latex-base
    texlive-latex-extra
    texlive-latex-recommended
    texlive-luatex
    texlive-pictures
    texlive-plain-generic
    texlive-science
    texlive-xetex
)

EXTRA_PACKAGES=(
    fonts-freefont-otf
    fonts-urw-base35
    texlive-bibtex-extra
)

MS_FONTS_PACKAGE=""
if apt-cache show ttf-mscorefonts-installer >/dev/null 2>&1; then
    MS_FONTS_PACKAGE="ttf-mscorefonts-installer"
elif apt-cache show msttcorefonts >/dev/null 2>&1; then
    MS_FONTS_PACKAGE="msttcorefonts"
fi

echo "Updating apt metadata..."
$SUDO apt-get update

if [[ -n "${MS_FONTS_PACKAGE}" ]]; then
    if [[ "${MS_FONTS_PACKAGE}" == "ttf-mscorefonts-installer" ]]; then
        echo "Pre-accepting Microsoft core fonts EULA for unattended install..."
        echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | \
            $SUDO debconf-set-selections
    fi
    EXTRA_PACKAGES+=("${MS_FONTS_PACKAGE}")
else
    cat <<'EOF'
Warning: neither 'ttf-mscorefonts-installer' nor 'msttcorefonts' is available
in apt. This repository uses Arial in surao.cls, so XeLaTeX will still fail
until Arial is installed or the class is changed to a different system font.
EOF
fi

echo "Installing TeX Live and font packages..."
$SUDO apt-get install -y "${APT_PACKAGES[@]}" "${EXTRA_PACKAGES[@]}"

cat <<'EOF'

Install complete.

Notes:
- This repository must be built with XeLaTeX or LuaLaTeX, not pdfLaTeX.
- The class file uses Arial as the main font and fonts/NotoSansMath-Regular.ttf
  as the math font.
- Typical build command:
    latexmk -xelatex main.tex

EOF
