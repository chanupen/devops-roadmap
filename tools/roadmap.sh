#!/usr/bin/env bash
# One command to follow the roadmap: see progress, start, check and stop labs.
# Topics and their order come from ROADMAP.md; labs are found under each topic's labs/ folder.
# Progress is stored per user in ~/.local/share/devops-roadmap/progress:
# one file per passed lab, plus .active naming the lab that is set up right now.
# Works with the bash 3.2 that ships with macOS.
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
STATE_DIR="${HOME}/.local/share/devops-roadmap/progress"
ACTIVE_FILE="${STATE_DIR}/.active"
mkdir -p "${STATE_DIR}"

if [[ -t 1 ]]; then
  BOLD=$'\033[1m'; DIM=$'\033[2m'; GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RED=$'\033[31m'; RESET=$'\033[0m'
else
  BOLD=""; DIM=""; GREEN=""; YELLOW=""; RED=""; RESET=""
fi

# Parallel arrays describing every lab, in roadmap order.
LAB_PATHS=()   # phases/<phase>/<topic>/labs/<lab>
LAB_TOPICS=()  # topic name from ROADMAP.md

usage() {
  cat <<EOF
${BOLD}./roadmap${RESET}               Show your progress and what to do next
${BOLD}./roadmap start${RESET} [lab]   Start a lab (default: your next unfinished lab)
${BOLD}./roadmap check${RESET} [lab]   Check your fix. PASS marks the lab done
${BOLD}./roadmap stop${RESET}  [lab]   Stop the lab and clean up everything it created
${BOLD}./roadmap hint${RESET}  [lab]   Show the lab instructions
${BOLD}./roadmap reset${RESET}         Forget all progress

[lab] is the lab number from ./roadmap, or part of its name (for example: 1, broken-service).
Without [lab], start/check/stop/hint use the lab you are working on now.
EOF
}

state_file() { echo "${STATE_DIR}/$(echo "$1" | tr '/' '_')"; }

is_passed() { [[ -f "$(state_file "$1")" ]]; }
mark_passed() { echo passed > "$(state_file "$1")"; }

# Reads ROADMAP.md and prints, for each step and topic, one line:
#   STEP|<step title>      or      TOPIC|<name>|<path>|<later: 0/1>
roadmap_entries() {
  local line re_step='^## (Step .*)$' re_topic='^\| \[([^]]+)\]\((phases/[^)]+)/\)( \*\*Later\*\*)? \|'
  while IFS= read -r line; do
    if [[ "${line}" =~ ${re_step} ]]; then
      echo "STEP|${BASH_REMATCH[1]}"
    elif [[ "${line}" =~ ${re_topic} ]]; then
      local later=0
      [[ -n "${BASH_REMATCH[3]}" ]] && later=1
      echo "TOPIC|${BASH_REMATCH[1]}|${BASH_REMATCH[2]}|${later}"
    fi
  done < "${REPO_ROOT}/ROADMAP.md"
}

labs_in_topic() {
  local dir
  for dir in "${REPO_ROOT}/$1"/labs/*/; do
    if [[ -f "${dir}setup.sh" ]]; then dir="${dir%/}"; echo "${dir#"${REPO_ROOT}"/}"; fi
  done
  return 0
}

load_labs() {
  local kind name path later lab
  while IFS='|' read -r kind name path later; do
    [[ "${kind}" == "TOPIC" ]] || continue
    while IFS= read -r lab; do
      [[ -n "${lab}" ]] || continue
      LAB_PATHS+=("${lab}")
      LAB_TOPICS+=("${name}")
    done < <(labs_in_topic "${path}")
  done < <(roadmap_entries)
}

lab_index_of() {
  local i
  for i in "${!LAB_PATHS[@]}"; do
    [[ "${LAB_PATHS[$i]}" == "$1" ]] && { echo "$i"; return 0; }
  done
  return 1
}

# The lab that is set up right now, if any.
current_lab() {
  local p
  [[ -f "${ACTIVE_FILE}" ]] || return 1
  p="$(cat "${ACTIVE_FILE}")"
  lab_index_of "${p}" >/dev/null || return 1
  echo "${p}"
}

next_lab() {
  local p
  for p in "${LAB_PATHS[@]+"${LAB_PATHS[@]}"}"; do
    is_passed "${p}" || { echo "${p}"; return 0; }
  done
  return 1
}

# Turns a lab number or name fragment into a lab path. Falls back to $2 when empty.
resolve_lab() {
  local want="$1" fallback="$2" i matches=()
  if [[ -z "${want}" ]]; then
    [[ -n "${fallback}" ]] && { echo "${fallback}"; return 0; }
    echo "${RED}No lab given and no lab in progress.${RESET} Run ./roadmap to see the list." >&2
    exit 1
  fi
  if [[ "${want}" =~ ^[0-9]+$ ]]; then
    i=$((want - 1))
    if (( i >= 0 && i < ${#LAB_PATHS[@]} )); then echo "${LAB_PATHS[$i]}"; return 0; fi
    echo "${RED}There is no lab ${want}.${RESET} Run ./roadmap to see the list." >&2
    exit 1
  fi
  for i in "${!LAB_PATHS[@]}"; do
    [[ "${LAB_PATHS[$i]}" == *"${want}"* ]] && matches+=("${LAB_PATHS[$i]}")
  done
  case "${#matches[@]}" in
    1) echo "${matches[0]}" ;;
    0) echo "${RED}No lab matches '${want}'.${RESET} Run ./roadmap to see the list." >&2; exit 1 ;;
    *) echo "${RED}'${want}' matches more than one lab:${RESET}" >&2; printf '  %s\n' "${matches[@]}" >&2; exit 1 ;;
  esac
}

label() {
  local i
  i="$(lab_index_of "$1")"
  echo "lab $((i + 1)) · ${LAB_TOPICS[$i]} · $(basename "$1")"
}

run_in_lab() { (cd "${REPO_ROOT}/$1" && "./$2"); }

cmd_status() {
  local kind name path later lab n=0 passed=0 topics=0 mark text cur=""
  cur="$(current_lab || true)"
  echo
  echo "${BOLD}DevOps Roadmap${RESET}"
  while IFS='|' read -r kind name path later; do
    if [[ "${kind}" == "STEP" ]]; then
      echo; echo "${BOLD}${name}${RESET}"
      continue
    fi
    topics=$((topics + 1))
    local tag=""
    [[ "${later}" == "1" ]] && tag=" ${DIM}(later)${RESET}"
    local found=0
    while IFS= read -r lab; do
      [[ -n "${lab}" ]] || continue
      found=1; n=$((n + 1))
      if is_passed "${lab}"; then
        mark="${GREEN}✔${RESET}"; text="${GREEN}done${RESET}"; passed=$((passed + 1))
        [[ "${lab}" == "${cur}" ]] && text="${GREEN}done${RESET} ${DIM}(still running)${RESET}"
      elif [[ "${lab}" == "${cur}" ]]; then
        mark="${YELLOW}▶${RESET}"; text="${YELLOW}in progress${RESET}"
      else
        mark="○"; text="not started"
      fi
      printf "  %s %-26s %2d. %-28s %s\n" "${mark}" "${name}" "${n}" "$(basename "${lab}")" "${text}${tag}"
    done < <(labs_in_topic "${path}")
    if [[ "${found}" == "0" ]]; then
      printf "  ${DIM}· %-26s     %-28s %s${RESET}\n" "${name}" "lab coming soon" "${tag:+(later)}"
    fi
  done < <(roadmap_entries)

  echo
  echo "${BOLD}Progress:${RESET} ${passed} of ${n} labs done  ${DIM}(${topics} topics, more labs coming)${RESET}"
  local nxt
  if [[ -n "${cur}" ]] && is_passed "${cur}"; then
    echo "${BOLD}Finished:${RESET} $(label "${cur}")"
    echo "  Clean up with:  ${BOLD}./roadmap stop${RESET}"
  elif [[ -n "${cur}" ]]; then
    echo "${BOLD}Working on:${RESET} $(label "${cur}")"
    echo "  Fix it, then run:  ${BOLD}./roadmap check${RESET}     (stuck? ${BOLD}./roadmap hint${RESET})"
  elif nxt="$(next_lab)"; then
    echo "${BOLD}Next:${RESET} $(label "${nxt}")"
    echo "  Run:  ${BOLD}./roadmap start${RESET}"
  elif (( n > 0 )); then
    echo "${GREEN}All available labs are done. Nice work!${RESET} New labs appear here when they are added."
  fi
  echo
}

cmd_start() {
  local lab cur
  lab="$(resolve_lab "${1:-}" "$(next_lab || true)")"
  if cur="$(current_lab)" && [[ "${cur}" != "${lab}" ]]; then
    echo "${YELLOW}You are still working on $(label "${cur}").${RESET}"
    echo "Run ${BOLD}./roadmap stop${RESET} first, or ${BOLD}./roadmap check${RESET} if you fixed it."
    exit 1
  fi
  echo "${BOLD}Starting $(label "${lab}")${RESET}"
  echo
  run_in_lab "${lab}" setup.sh
  echo "${lab}" > "${ACTIVE_FILE}"
  echo
  echo "Your task: read the instructions with ${BOLD}./roadmap hint${RESET}, fix the problem,"
  echo "then run ${BOLD}./roadmap check${RESET}."
}

cmd_check() {
  local lab
  lab="$(resolve_lab "${1:-}" "$(current_lab || true)")"
  echo "${BOLD}Checking $(label "${lab}")${RESET}"
  if run_in_lab "${lab}" check.sh; then
    mark_passed "${lab}"
    echo
    echo "${GREEN}${BOLD}Done!${RESET} Clean up with ${BOLD}./roadmap stop${RESET}, then see what's next with ${BOLD}./roadmap${RESET}."
  else
    echo
    echo "Not fixed yet. Keep going. Stuck? ${BOLD}./roadmap hint${RESET}"
    exit 1
  fi
}

cmd_stop() {
  local lab
  lab="$(resolve_lab "${1:-}" "$(current_lab || true)")"
  echo "${BOLD}Stopping $(label "${lab}")${RESET}"
  run_in_lab "${lab}" cleanup.sh
  [[ "$(current_lab || true)" == "${lab}" ]] && rm -f "${ACTIVE_FILE}"
  return 0
}

cmd_hint() {
  local lab
  lab="$(resolve_lab "${1:-}" "$(current_lab || next_lab || true)")"
  echo "${DIM}${REPO_ROOT}/${lab}/README.md${RESET}"
  echo
  cat "${REPO_ROOT}/${lab}/README.md"
}

cmd_reset() {
  printf "Forget all progress? Labs that are running are not stopped. [y/N] "
  local answer
  read -r answer
  if [[ "${answer}" == [yY]* ]]; then
    rm -rf "${STATE_DIR}"
    echo "Progress cleared."
  fi
}

main() {
  local cmd="${1:-status}"
  shift || true
  load_labs
  case "${cmd}" in
    status|list|ls) cmd_status ;;
    start|up)       cmd_start "$@" ;;
    check|verify)   cmd_check "$@" ;;
    stop|clean|down) cmd_stop "$@" ;;
    hint|help-lab|readme) cmd_hint "$@" ;;
    reset)          cmd_reset ;;
    -h|--help|help) usage ;;
    *) echo "${RED}Unknown command: ${cmd}${RESET}"; echo; usage; exit 1 ;;
  esac
}

main "$@"
