# Git Fundamentals

Git is a free and open-source version control system
Version controlis the practice of tracking and managing changes to software code. Version control systems are software tools that help software teams manage changes to source code over time.
Source code management (SCM) is used to track modifications to a source code repository.
Install Git using https://git-scm.com/downloads

After confirm version using `git --version`

Use the following commands to configure yur details on git, this will be associated to your git history
```
git config --global user.name "suliaman olubiyi"
git config --global user.email "scontinum@gmail.com"
```
Git stores information in this structure;
```
Local: /.git/config – Repository-specific settings.
Global: /.gitconfig – User-specific settings. This is where options set with the --global flag are stored.
```

Git has 3 internal structure or trees
1. Working Directory: This tree is in sync with the local filesystem and is representative of the immediate changes made to content in files and directories.
2. Staging Index: This tree is tracking Working Directory changes, that have been promoted with git add, to be stored in the next commit.
3. Commit History: The git commit command adds changes to a permanent snapshot that lives in the Commit History. This snapshot also includes the state of the Staging Index at the time of commit.

# Getting Hands-on
* Create a new repository `git init`
* For cloning an existing repository `git clone <repo url>`
* After creating new files or folder, proceed to staging area using ;
  for specific file `git add file.txt`
  For all files and folders  `git add .` or   `git add --all`
* Create a commit with message for the staged files `git commit -m "Adding a new file"`
* Check the history of git files, using `git status`
* To check all commit message and id using `git log --oneline`
* Checking diiference between content of files using `git diff`

## Collaboration 
* Collaboration with remote repository setup , it needs to added on your local git config
Usually remote repo setup include github, gitlab, bitbucket, aws codecommit, azure repos, gcp csr

The `git remote` command is essentially an interface for managing a list of remote entries that are stored in the repository

`git remote -v to get verbose details`

`origin is the remote_name below`

` git remote add origin <remote_repo_url>`

 `git fetch origin`

This wil download the remote content but not update your local repo's working state, leaving your current work intact
then you inspect and merge to your working branch

```
git log origin/main
git merge origin/main
```

 This automatically update your local repo's working state.
 
 `git pull origin main`


* Pushing changes from local reposiroty to remote repository
`git push -u origin <local_branch_name>`

`git branch`

This will output a list of the local branch refs ./.git/refs/heads/

`git branch -r `

This stores the list of branches from the remote ./.git/refs/remotes/

`git branch <branch_name>`

This create a new branch but does not checkout to it 

`git checkout <branch_name>`

This is for switching brannches  , -b for creating new branch and switch to it.

`git branch -d <branch_name>`

This prevents from deleting the branch if it has unmerged changes, while -D doesn't mind

`git push origin --delete crazy-experiment`

This is used to delete a remote branch

git branch -m <branch>

To rename branch and git branch -a to list all branches

`git push <remote> <branch>`

## Git Merge
git merge is used to combine two branches
Steps invloved in merging branch
# Start a new feature
git checkout -b new-feature main
# Edit some files
git add <file>
git commit -m "Start a feature"
# Edit some files
git add <file>
git commit -m "Finish a feature"
# Merge in the new-feature branch
git checkout main
git merge new-feature
git branch -d new-feature


## Makking Pull requests

```
git clone https://username/test-projects.git
# Note that git clone automatically creates an origin remote that points to this repo_url

git checkout -b new-feature
git add new file
git commit -m "Adding new branch and new feature"
git push origin new-feature
```


## Undoing changes
* Untracked files are files that have been created within your repo's working directory but have not yet been added to the repository's tracking index using the git add
`git clean -f ` remove untracked files -f option is to force, -n is for dry-run

* The git revert command is used for undoing changes to a repository's commit history.
A revert operation will take the specified commit, inverse the changes from that commit, and create a new "revert commit".
```
mkdir revert-test
cd revert-test
touch file
git add file
git commit -m "Initial commit"
echo "first line of code" >> file
git commit -m "add first line to file"
echo "Second line of code" >> file
git commit -m "add second line to file"
git log --oneline
```
Initiating a `git revert HEAD`
This will revert the latest commit
HEAD refers to the current snapshot of your working directory, it points to the latest commit on the current branch you're working on.

* Resetting
Note that git revert undoes a single commit, it does not "revert" back to the previous state of a project by removing all subsequent commits
it has three line arguments --soft, --mixed, --hard
The git reset command is used to undo a commit or staged snapshot. it moves both HEAD and main to the reset point.
Default command means `git reset` means `git reset --mixed HEAD`

* Undo the last commit, but keep changes staged: 

`git reset --soft HEAD~1`

* Undo the last commit, unstage changes but keep files

`git reset --mixed HEAD~1`

* Undo the last commit, delete changes completely, --hard permanently deletes changes from both staging and working directory

`git reset --hard HEAD~1`


