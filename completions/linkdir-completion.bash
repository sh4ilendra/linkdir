# Bash completion for linkdir
_linkdir_completions() {
  local cur prev
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"

  if [[ $COMP_CWORD -eq 1 ]]; then
    COMPREPLY=( $(compgen -W "add open path list remove rm delete f help" -- "$cur") )
    return 0
  fi

  case "$prev" in
    open|remove|rm|delete|path)
      local keys
      keys="$(linkdir _keys 2>/dev/null || true)"
      COMPREPLY=( $(compgen -W "$keys" -- "$cur") )
      return 0
      ;;
    add)
      return 0
      ;;
  esac
}

complete -F _linkdir_completions linkdir