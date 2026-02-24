#!/usr/bin/env bash
set -euo pipefail

# Hard-coded groups to add users to
STUDENT_GROUPS=("workshop")

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTFILE="$SCRIPT_DIR/accounts.json"

# The original caller (non-root) who invoked sudo. Used to own created files.
OWNER="${SUDO_USER:-$(logname 2>/dev/null || echo root)}"

usage() {
  echo "Usage: $0 <number-of-students>" >&2
  echo "Example: $0 12" >&2
  exit 2
}

if [ "${EUID:-0}" -ne 0 ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if [ "$#" -lt 1 ]; then
  usage
fi

if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "First argument must be a positive integer." >&2
  usage
fi

NUM=$1
if [ "$NUM" -le 0 ]; then
  echo "Number of students must be greater than zero." >&2
  exit 2
fi

# Ensure groups exist
for g in "${STUDENT_GROUPS[@]}"; do
  if ! getent group "$g" >/dev/null; then
    groupadd "$g"
  fi
done

# Primary group name
PRIMARY_GROUP_NAME="${STUDENT_GROUPS[0]}"
echo "Using primary group: $PRIMARY_GROUP_NAME"

exit 0

# Resolve primary GID robustly and fail if not resolvable
if getent group "$PRIMARY_GROUP_NAME" >/dev/null 2>&1; then
  PRIMARY_GID=$(getent group "$PRIMARY_GROUP_NAME" | cut -d: -f3)
else
  echo "Group $PRIMARY_GROUP_NAME not found and could not be created" >&2
  exit 1
fi

# EFF Diceware wordlist (cached local copy). Falls back to a small built-in list if download fails.
WORDLIST_URL="https://www.eff.org/files/2016/07/18/eff_large_wordlist.txt"
WORDLIST_FILE="$SCRIPT_DIR/eff_large_wordlist.txt"

load_wordlist() {
  if [ -f "$WORDLIST_FILE" ]; then
    :
  else
    if command -v curl >/dev/null 2>&1; then
      curl -fsSL "$WORDLIST_URL" -o "$WORDLIST_FILE" || rm -f "$WORDLIST_FILE"
    elif command -v wget >/dev/null 2>&1; then
      wget -q -O "$WORDLIST_FILE" "$WORDLIST_URL" || rm -f "$WORDLIST_FILE"
    fi
  fi

  if [ -f "$WORDLIST_FILE" ]; then
    # EFF list format: code <tab> word
    mapfile -t WORDS < <(awk '{print $2}' "$WORDLIST_FILE")
    chown "$OWNER":"$OWNER" "$WORDLIST_FILE" 2>/dev/null || true
  else
    WORDS=(apple river moon star green blue red sun cloud code learn build play jump run fast slow bright quiet loud small big clear stone hill tree house cat dog fox lion bear wolf eagle sail boat car bike train rocket robot pixel domino canvas garden music color math science logic debug)
    echo "Warning: using built-in fallback wordlist (EFF download failed)." >&2
  fi
}

load_wordlist

capitalize() {
  local w="$1"
  if [ -z "$w" ]; then
    echo ""
    return
  fi
  first="${w:0:1}";
  rest="${w:1}";
  echo "${first^^}${rest,,}"
}

rand_index() {
  echo $((RANDOM % ${#WORDS[@]}))
}

gen_passphrase() {
  local i1 i2 i3 w1 w2 w3 pos num
  i1=$(rand_index)
  i2=$(rand_index)
  i3=$(rand_index)
  while [ "$i2" -eq "$i1" ]; do i2=$(rand_index); done
  while [ "$i3" -eq "$i1" ] || [ "$i3" -eq "$i2" ]; do i3=$(rand_index); done
  w1=$(capitalize "${WORDS[$i1]}")
  w2=$(capitalize "${WORDS[$i2]}")
  w3=$(capitalize "${WORDS[$i3]}")

  pos=$((RANDOM % 3))
  num=$((RANDOM % 900 + 100))
  case "$pos" in
    0) w1="${w1}${num}" ;;
    1) w2="${w2}${num}" ;;
    2) w3="${w3}${num}" ;;
  esac

  echo "${w1}-${w2}-${w3}"
}

escape_json() {
  local s="$1"
  s=${s//\\/\\\\}
  s=${s//\"/\\\"}
  echo "$s"
}

tmpfile="$(mktemp)"
echo "[" > "$tmpfile"

first=true
for i in $(seq 1 "$NUM"); do
  username="student${i}"
  password="$(gen_passphrase)"

  if id -u "$username" >/dev/null 2>&1; then
    # Ensure the user's primary group and supplementary groups are correct.
    current_gid="$(id -g "$username")"
    groups_list="$(id -nG "$username")"
    if [ "$current_gid" != "$PRIMARY_GID" ] || ! echo "$groups_list" | grep -qw "$PRIMARY_GROUP_NAME"; then
      # Replace primary and supplementary groups to enforce policy (use numeric GID)
      usermod -g "$PRIMARY_GID" -G "${STUDENT_GROUPS[*]}" "$username" || true
      echo "Fixed groups for existing user $username (set GID $PRIMARY_GID)"
    else
      echo "User $username already has correct groups"
    fi
  else
    # create the user with the primary group set by numeric GID
    useradd -m -s /bin/bash -g "$PRIMARY_GID" -G "${STUDENT_GROUPS[*]}" "$username"
    echo "Created user $username with primary group $PRIMARY_GROUP_NAME (GID $PRIMARY_GID)"
  fi

  echo "$username:$password" | chpasswd

  juser=$(escape_json "$username")
  jpass=$(escape_json "$password")
  if [ "$first" = true ]; then
    first=false
    printf '  {"username":"%s","password":"%s"}' "$juser" "$jpass" >> "$tmpfile"
  else
    printf ',\n  {"username":"%s","password":"%s"}' "$juser" "$jpass" >> "$tmpfile"
  fi
done

echo -e "\n]" >> "$tmpfile"

mv "$tmpfile" "$OUTFILE"
chmod 600 "$OUTFILE"
chown "$OWNER":"$OWNER" "$OUTFILE" 2>/dev/null || true

echo "Wrote $NUM accounts to $OUTFILE"

exit 0
