-- | The repo watching API as described on
-- <http://developer.github.com/v3/repos/watching/>.
module Github.Repos.Watching (
 watchersFor
,reposWatchedBy
,module Github.Data
) where

import Github.Data
import Github.Api

-- | The list of users that are watching the specified Github repo.
--
-- > watchersFor "thoughtbot" "paperclip"
watchersFor :: String -> String -> IO (Either Error [GithubOwner])
watchersFor userName repoName =
  githubGet ["repos", userName, repoName, "watchers"]

-- | All the public repos watched by the specified user.
--
-- > reposWatchedBy "croaky"
reposWatchedBy :: String -> IO (Either Error [Repo])
reposWatchedBy userName = githubGet ["users", userName, "watched"]
