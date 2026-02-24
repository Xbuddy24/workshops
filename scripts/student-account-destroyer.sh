#!/usr/bin/env bash
set -euo pipefail

# Remove users whose usernames start with "student" and clean up related files.

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUTFILE="$SCRIPT_DIR/accounts.json"
OWNER="${SUDO_USER:-$(logname 2>/dev/null || echo root)}"

if [ "${EUID:-0}" -ne 0 ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

echo "Finding users starting with 'student'..."
users=$(getent passwd | awk -F: '/^student[0-9]*/ {print $1}') || users=""

if [ -z "$users" ]; then
  echo "No student users found."
else
  for u in $users; do
    echo "Deleting user: $u"
    # try to remove user and their home dir
    if userdel -r "$u" >/dev/null 2>&1; then
      echo "Removed user $u"
    else
      echo "Failed to remove user $u with userdel - attempting force cleanup" >&2
      # attempt to remove home dir and mail spool manually
      rm -rf "/home/$u" "/var/mail/$u" 2>/dev/null || true
      # remove user entry from /etc/passwd if still present (careful)
      if id -u "$u" >/dev/null 2>&1; then
        deluser --remove-home "$u" >/dev/null 2>&1 || true
      fi
    fi
  done
fi

# Remove any leftover /home/student* directories that may remain
echo "Cleaning leftover home directories..."
for d in /home/student*; do
  if [ -d "$d" ]; then
    echo "Removing directory $d"
    rm -rf "$d" || true
  fi
done

# Update accounts.json by removing any entries for student* usernames
if [ -f "$OUTFILE" ]; then
  echo "Updating $OUTFILE to remove student entries..."
  if command -v python3 >/dev/null 2>&1; then
    python3 - <<PY
import json
f='''$OUTFILE'''
try:
    with open(f,'r') as fh:
        data=json.load(fh)
except Exception:
    print('Warning: could not parse JSON; leaving file unchanged')
    raise SystemExit(0)
new=[o for o in data if not str(o.get('username','')).startswith('student')]
with open(f+'.tmp','w') as fh:
    json.dump(new,fh,indent=2)
PY
    mv "$OUTFILE.tmp" "$OUTFILE"
    chown "$OWNER":"$OWNER" "$OUTFILE" 2>/dev/null || true
    echo "Updated $OUTFILE"
  else
    echo "python3 not available; removing $OUTFILE instead" >&2
    rm -f "$OUTFILE" || true
  fi
fi

echo "Done."

exit 0
