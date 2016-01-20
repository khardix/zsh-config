## khardix prompt theme
# vim:set ft=zsh:

# set parameter expansion, command substitution and arithmetric expansion in prompt
setopt PROMPT_SUBST

#blocks
blck_start="%{${fg[white]}─᚜%G$reset_color%}"
blck_end="%{${fg[white]}᚛%G$reset_color%}"

# user & hostname logic
kh_identity()
{
  #username; color - normal: bold red, root: bold yellow
  local username="%{%(!.${fg_bold[yellow]}.${fg_bold[red]})%}%n%{$reset_color%}"

  #hostname; color - normal: bold red, ssh: bold yellow
  if [[ -z "$SSH_CLIENT" ]]; then
    # not ssh
    local hostname="%{${fg_bold[red]}%}%m%{$reset_color%}"
  else
    local hostname="%{${fg_bold[yellow]}%}%m%{$reset_color%}"
  fi

  echo -n "${blck_start}$username@$hostname${blck_end}" && return
}

# path logic
kh_path()
{
  # this local path is not special
  local -h path="%{${fg[yellow]}%}%55<...<%3~%{$reset_color%}"

  echo -n "${blck_start}$path${blck_end}" && return
}

# exit code logic
kh_exitcode()
{
  local color="%(1?.%{${fg_bold[white]}${bg[red]}%}.%{${fg_bold[yellow]}%})"

  echo -n "${blck_start}${color}EC: %?%{$reset_color%}${blck_end}"
}

# prompt character logic
function kh_character
{
  if git branch &>/dev/null; then
    local char='᚜'
  elif hg root &>/dev/null; then
    local char='☿'
  else
    local char='◇'
  fi

  echo -n "%{${fg[white]}─${char}$reset_color%2G%}"
}

#git info
kh_git()
{
  #use only part of the lib/git functions, others are slighty modified

  #settings
  ## branch
  ZSH_THEME_GIT_PROMPT_DIRTY="%{${fg[red]}✘$reset_color%1G%}"
  ZSH_THEME_GIT_PROMPT_CLEAN="%{${fg[green]}✔$reset_color%1G%}"
  ## sha
  ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{${fg[yellow]}%}"
  ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%}"

  # name of actual branch; if none, exit - we are not in git repo
  ref=$(git symbolic-ref HEAD 2>/dev/null) || return
  branch="%{${fg[magenta]}%}${ref#refs/heads/}%{$reset_color%}"

  # number of ahead commits
  if local num_ahead=`git log origin/$(current_branch)..HEAD 2>/dev/null | grep -c '^commit'`; then
    local git_ahead="%{${fg_bold[yellow]}%}$num_ahead%{${fg_bold[blue]}⇈$reset_color%1G%}"
  else
    local git_ahead=''
  fi

  echo -n "${blck_start}${branch}:$(git_prompt_short_sha):$(parse_git_dirty)${git_ahead}${blck_end}"
}

# Display count of total and high-priority tasks
kh_tasks()
{
  if [ -e /usr/bin/task ]; then
    echo -n "%{${fg[white]}%}TODO: `task status:pending count` tasks, %{${fg_bold[red]}%}`task status:pending priority:H count` H%{$reset_color%}"
  fi
}

# Display next task
kh_next_task()
{
  local task_fields="id,description" next_task_line task_id task_desc
  if [ -x /usr/bin/task ]; then
    next_task_line="$(task next rc.verbose=nothing rc.report.next.columns:$task_fields rc.report.next.labels:$task_fields limit:1|sed 's/^[[:space:]]*//')"
    task_id="$(echo $next_task_line|cut -d' ' -f1)"
    task_desc="$(echo $next_task_line|cut -d' ' -f1 --complement)"
    echo -n "%{${fg[red]}%}${task_desc}%{$reset_color%} %{${fg[magenta]}%}[${task_id}]%{$reset_color%}"
  fi
}

# Detect python virtual environment
kh_venv()
{
  if [ -n "$VIRTUAL_ENV" ]; then
    echo -n "${blck_start}%{${fg_bold[blue]}%}$(basename "$VIRTUAL_ENV")%{$reset_color%}${blck_end}"
  fi
}

## spacers
l1_beg="%{${fg[white]}╭$reset_color%1G%}"
l2_beg="%{${fg[white]}╰$reset_color%1G%}"
l1_end="%{${fg[white]}─◇$reset_color%2G%}"

## prompts themselves
if ps $PPID|grep mc; then
  PROMPT='$(kh_identity)$(kh_git)${l1_end} '
else
PROMPT='${l1_beg}$(kh_identity)$(kh_path)%(?..$(kh_exitcode))$(kh_venv)$(kh_git)${l1_end}
${l2_beg}$(kh_character) '

RPROMPT='$(kh_next_task)'
fi
