# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理する個人 dotfiles。

## セットアップ

```sh
brew install chezmoi
chezmoi init --apply tiwanari
```

## 管理対象

| カテゴリ | ファイル |
|---|---|
| Zsh | `.zshenv`, `.config/zsh/{.zshrc, aliases, exports, completions, keybindings}` |
| Bash | `.bashrc`, `.bash_profile`, `.bash_aliases`, `.bash_logout` |
| Git | `.config/git/config` |
| GitHub CLI | `.config/gh/config.yml` |
| Neovim | `.config/nvim/{init.vim, bindings, dein, plugins/}` |
| Zed | `.config/zed/settings.json` |
| IdeaVim | `.config/ideavim/ideavimrc` |
| Homebrew | `.config/homebrew/Brewfile` |

## Homebrew パッケージ管理

`Brewfile` でパッケージを宣言的に管理。`chezmoi apply` 時に Brewfile の変更を検知して `brew bundle install` が自動実行される。

```sh
# パッケージを追加・削除
chezmoi edit ~/.config/homebrew/Brewfile
chezmoi apply

# 現在の Brewfile で不足しているパッケージを確認
brew bundle check --verbose --file=~/.config/homebrew/Brewfile
```

## よく使うコマンド

```sh
# $HOME のファイルを変更した後、chezmoi に取り込む
chezmoi add ~/.config/zsh/aliases.zsh

# chezmoi のソースを編集して適用
chezmoi edit ~/.config/git/config
chezmoi apply

# 差分を確認（dry-run）
chezmoi diff
```
