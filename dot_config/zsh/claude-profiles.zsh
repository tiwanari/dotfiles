# Claude Code: 作業ディレクトリでアカウント（プロファイル）を切り替える
#
# 既定（estie / その他すべて）= CLAUDE_CONFIG_DIR を設定しない。
#   既定パスを明示指定すると別プロファイル扱いになって既存ログインを見失うため、
#   必ず unset にすること（末尾スラッシュ 1 文字でも壊れる）。
#
# 追加するときは _claude_profile_for_pwd の case に 1 行足し、
# 対応する ~/.claude-<name> を作って `claude auth login` する。

_claude_profile_for_pwd() {
  case "$PWD/" in
    "$HOME"/repos/coten/*) print -r -- "$HOME/.claude-coten" ;;
    *)                     print -r -- "" ;;
  esac
}

_claude_profile_apply() {
  local p; p="$(_claude_profile_for_pwd)"
  if [[ -n "$p" ]]; then
    export CLAUDE_CONFIG_DIR="$p"
  else
    unset CLAUDE_CONFIG_DIR
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd _claude_profile_apply
_claude_profile_apply   # シェル起動時にも 1 回適用する

# 今どのアカウントで動くか
alias claude-whoami='claude auth status --text'

# 一時的にそのプロファイルで 1 回だけ動かす（ディレクトリ問わず）
claude-coten() { CLAUDE_CONFIG_DIR="$HOME/.claude-coten" claude "$@" }

# プロンプト右端にプロファイル名を出す（既定プロファイルでは何も出ない）
_claude_profile_tag() { [[ -n "$CLAUDE_CONFIG_DIR" ]] && print -r -- "cc:${CLAUDE_CONFIG_DIR:t}" }
setopt PROMPT_SUBST
RPROMPT='$(_claude_profile_tag)'
