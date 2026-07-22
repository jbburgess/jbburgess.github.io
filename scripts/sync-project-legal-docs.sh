#!/usr/bin/env bash
set -euo pipefail

# Required environment variables (provided by GitHub Actions):
#   SOURCE_REPOS  - comma-separated list of repository names (no owner prefix)
#   SOURCE_BRANCH - branch name in source repos (for example: master)
#   SOURCE_BASE   - raw-content host base (for example: https://raw.githubusercontent.com)

SOURCE_OWNER="jbburgess"

require_env() {
  local name="$1"
  if [[ -z "${!name:-}" ]]; then
    echo "Missing required environment variable: ${name}" >&2
    exit 1
  fi
}

require_env SOURCE_REPOS
require_env SOURCE_BRANCH
require_env SOURCE_BASE

TMP_DIR=".tmp-legal-sync"
mkdir -p "${TMP_DIR}"

cleanup() {
  rm -rf "${TMP_DIR}"
}
trap cleanup EXIT

trim() {
  local s="$1"
  s="${s#${s%%[![:space:]]*}}"
  s="${s%${s##*[![:space:]]}}"
  printf '%s' "$s"
}

fetch_doc() {
  local source_repo="$1"
  local source_docs_base="$2"
  local out_dir="$3"
  local source_name="$4"
  local out_name="$5"
  local page_title="$6"
  local page_permalink="$7"

  local source_file="${TMP_DIR}/${out_dir}-${source_name}"
  local body_file="${TMP_DIR}/${out_dir}-${source_name}.body"
  local out_file="${out_dir}/${out_name}"

  curl -fsSL "${source_docs_base}/${source_name}" -o "${source_file}"

  # Drop any leading front matter from source docs, then remove the first H1.
  awk 'BEGIN{in_fm=0;done=0} NR==1 && $0=="---" {in_fm=1;next} in_fm && $0=="---" {in_fm=0;done=1;next} !in_fm && done {print} !in_fm && !done {print}' "${source_file}" \
    | awk 'BEGIN{removed=0} !removed && $0 ~ /^# / {removed=1; next} {print}' \
    > "${body_file}"

  {
    echo "---"
    echo "layout: default"
    echo "title: ${page_title}"
    echo "permalink: ${page_permalink}"
    echo "---"
    echo
    echo "<!-- Synced from ${source_repo}/docs/${source_name}. Do not edit here. -->"
    echo
    cat "${body_file}"
  } > "${out_file}"
}

for raw_repo_name in ${SOURCE_REPOS//,/ }; do
  repo_name="$(trim "$raw_repo_name")"
  [[ -z "$repo_name" ]] && continue

  source_repo="${SOURCE_OWNER}/${repo_name}"
  out_dir="${repo_name}"
  source_docs_base="${SOURCE_BASE}/${source_repo}/${SOURCE_BRANCH}/docs"

  mkdir -p "${out_dir}"

  fetch_doc "$source_repo" "$source_docs_base" "$out_dir" "privacy-policy.md" "privacy-policy.md" "Privacy Policy" "/${out_dir}/privacy-policy"
  fetch_doc "$source_repo" "$source_docs_base" "$out_dir" "terms-and-conditions.md" "terms-and-conditions.md" "Terms and Conditions" "/${out_dir}/terms-and-conditions"
done
