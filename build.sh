#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_root"
build_dir="$repo_root/_build"

mkdir -p .texlive-var .texlive-config .texlive-home
mkdir -p "$build_dir"
export TEXMFVAR="$repo_root/.texlive-var"
export TEXMFCONFIG="$repo_root/.texlive-config"
export TEXMFHOME="$repo_root/.texlive-home"

if ! git rev-parse --verify HEAD >/dev/null 2>&1; then
  echo "No Git history found. Cannot compare main.tex against HEAD." >&2
  exit 1
fi

if ! git ls-files --error-unmatch -- main.tex >/dev/null 2>&1; then
  echo "main.tex is not tracked by Git. Cannot build a comparison PDF." >&2
  exit 1
fi

old_source_label="HEAD:main.tex"
old_source_ref="HEAD:main.tex"

if ! git diff --cached --quiet -- main.tex; then
  old_source_label="staged main.tex"
  old_source_ref=":main.tex"
fi

tmp_old="$(mktemp)"
tmp_diff="$(mktemp "$repo_root/.main-d.XXXXXX.tex")"
trap 'rm -f "$tmp_old" "$tmp_diff"' EXIT

rm -f \
  "$build_dir/main.pdf" \
  "$build_dir/main-d.pdf" \
  "$build_dir/main-d.tex"

git show "$old_source_ref" > "$tmp_old"

latexdiff \
  --flatten \
  --math-markup=whole \
  --graphics-markup=none \
  --append-safecmd="vc,tn,symbfit,norm,grad,div,MMD,KL,TV,Real" \
  --append-textcmd="vc,tn,symbfit,norm" \
  "$tmp_old" \
  main.tex > "$tmp_diff"

latexmk -f -lualatex -interaction=nonstopmode -file-line-error -outdir="$build_dir" main.tex
latexmk -f -lualatex -interaction=nonstopmode -file-line-error -jobname=main-d -outdir="$build_dir" "$tmp_diff"

cp "$build_dir/main.pdf" "$repo_root/main.pdf"
cp "$build_dir/main-d.pdf" "$repo_root/main-d.pdf"

printf 'Built working-copy PDF: %s/main.pdf\n' "$repo_root"
printf 'Built comparison PDF: %s/main-d.pdf\n' "$repo_root"
printf 'Build directory: %s\n' "$build_dir"
printf 'Reference version: %s\n' "$old_source_label"
