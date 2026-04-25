# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

chezmoi で管理する個人 dotfiles リポジトリ。macOS / Linux 両対応。

## chezmoi の使い方

```sh
# 新しいマシンにセットアップ
brew install chezmoi
chezmoi init --apply tiwanari

# 設定ファイルを編集後、差分確認 → 適用
chezmoi diff
chezmoi apply

# $HOME のファイルを変更した場合、chezmoi に取り込む
chezmoi add ~/.config/zsh/aliases.zsh

# シンボリンクのターゲットを辿って追加（homesick 等から移行時）
chezmoi add --follow ~/.zshenv
```

## アーキテクチャ

chezmoi のソースディレクトリ構造。`dot_` プレフィックスが `$HOME` の `.` に対応する。

- `dot_zshenv` → `~/.zshenv` — XDG Base Directory 設定、ZDOTDIR 指定
- `dot_config/zsh/` → `~/.config/zsh/` — zsh のメイン設定（exports, aliases, completions, keybindings に分割）
- `dot_config/git/config` → `~/.config/git/config` — グローバル git 設定
- `dot_config/homebrew/Brewfile` → `~/.config/homebrew/Brewfile` — Homebrew パッケージの宣言的管理
- `dot_config/nvim/` → `~/.config/nvim/` — Neovim 設定（dein.vim でプラグイン管理）
- `dot_bash*` → bash 設定（レガシー / Linux 用）
- `run_onchange_after_install-packages-darwin.sh.tmpl` — Brewfile 変更時に `brew bundle install` を自動実行（macOS のみ）

### テンプレート

`.tmpl` 拡張子のファイルは chezmoi テンプレート。`{{ .chezmoi.homeDir }}` 等でマシン依存値を展開する。

nvim の `init.vim` は vim fold marker `{{{` と Go テンプレートの `{{ }}` が衝突するため、カスタムデリミタ `[[ ]]` を使用する：

```
{{- /* chezmoi:template:left-delimiter=[[ right-delimiter=]] */ -}}
```

## 注意事項

- 認証情報を含むファイル（`gh/hosts.yml`, `~/.ssh/` 等）は絶対に追加しない
- OS 固有の設定は `case "$OSTYPE"` で分岐する既存パターンに従う
- pyenv / rbenv は未インストール環境でもエラーにならないよう `command -v` でガードする
