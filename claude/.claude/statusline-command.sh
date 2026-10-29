#!/bin/bash
# Claude Code status line
# Order: 1) cwd  2) git branch/worktree/dirty  3) model  4) context usage  5) rate limit usage

input=$(cat)

# --- 1. Current directory (abbreviate $HOME to ~) ---
dir=$(echo "$input" | jq -r '.workspace.current_dir')
dir_display="${dir/#$HOME/~}"

# --- 2. Git branch, worktree name, dirty/clean status ---
git_seg=""
if git --no-optional-locks -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git --no-optional-locks -C "$dir" branch --show-current 2>/dev/null)
  if [ -z "$branch" ]; then
    short_sha=$(git --no-optional-locks -C "$dir" rev-parse --short HEAD 2>/dev/null)
    branch="detached@${short_sha}"
  fi

  worktree=$(echo "$input" | jq -r '.worktree.name // empty')
  if [ -z "$worktree" ]; then
    worktree=$(echo "$input" | jq -r '.workspace.git_worktree // empty')
  fi

  if [ -n "$(git --no-optional-locks -C "$dir" status --porcelain 2>/dev/null)" ]; then
    dirty="*"
  else
    dirty=""
  fi

  git_seg="${branch}${dirty}"
  [ -n "$worktree" ] && git_seg="${git_seg} [${worktree}]"
fi

# --- 3. Claude model name ---
model=$(echo "$input" | jq -r '.model.display_name')

# --- 4. Context window usage ---
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used_pct" ]; then
  ctx=$(printf '%.0f%%' "$used_pct")
else
  ctx="-"
fi

# --- 5. Usage limit percentage (Claude.ai plan rate limits) ---
five=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
week=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
limit=""
if [ -n "$five" ]; then
  limit="5h $(printf '%.0f' "$five")%"
fi
if [ -n "$week" ]; then
  [ -n "$limit" ] && limit="$limit "
  limit="${limit}7d $(printf '%.0f' "$week")%"
fi
[ -z "$limit" ] && limit="-"

# --- Render (dimmed, distinct colors per segment, "|" separators) ---
printf '\033[2;36m%s\033[0m' "$dir_display"
if [ -n "$git_seg" ]; then
  printf ' \033[2m|\033[0m \033[2;33m%s\033[0m' "$git_seg"
fi
printf ' \033[2m|\033[0m \033[2;35m%s\033[0m' "$model"
printf ' \033[2m|\033[0m \033[2;34mctx %s\033[0m' "$ctx"
printf ' \033[2m|\033[0m \033[2mlimit %s\033[0m\n' "$limit"
