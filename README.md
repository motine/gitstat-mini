# Gitstat Mini

Very, very basic tool to get a few statistics from a git repo.
Please be sure to have Ruby installed (>= 2.6).
Use the first argument to give a time period for "[since](https://www.git-scm.com/docs/git-log#_commit_limiting)":

```bash
cd MY_REPO
PATH_TO_THIS_REPO/gitstat.rb 4 weeks ago
# =>
#   Manfred Tester                        16 commits   1461+    239-     85 files
#   Silke Musterfrau                      87 commits   2837+   1747-    379 files
#   John Doe                              53 commits   2175+    975-    220 files
#   Fish Cheeser                          66 commits   3659+   1263-    236 files
```
