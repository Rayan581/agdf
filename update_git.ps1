git add .
git commit -m "Update README and project structure"

$env:GIT_COMMITTER_DATE="2026-05-15T22:34:18"
$env:GIT_AUTHOR_DATE="2026-05-15T22:34:18"

$commits = git --no-pager log --format="%H" 334720c..HEAD
[array]::Reverse($commits)

git checkout 334720c

foreach ($commit in $commits) {
    git cherry-pick $commit
    git commit --amend --no-edit --date="2026-05-15T22:34:18"
}

git branch -f main HEAD
git checkout main
