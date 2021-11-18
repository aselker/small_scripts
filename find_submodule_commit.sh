#!/bin/bash
set -eo pipefail

submodule_path=${1:-}
submodule_commit=${2:-}

if [[ -z "${submodule_path}" || -z "${submodule_commit}" ]]; then
    echo "usage: find_submodule_commit.sh <submodule-path> <submodule-commit>"
    exit 1
fi

MAX_COUNT=10000

for commit in $(git rev-list --all --max-count ${MAX_COUNT}); do
    found_submodule_commit=$(git ls-tree "${commit}" -- "${submodule_path}" | awk '{print $3}')
	if [[ $found_submodule_commit =~ ^$submodule_commit ]]; then
        echo "match: ${commit}"
    fi
done
