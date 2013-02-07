-- | The pull request review comments API as described at
-- <http://developer.github.com/v3/pulls/comments/>.
module Github.PullRequests.ReviewComments (
 pullRequestReviewComments
,pullRequestReviewComment
,module Github.Data
) where

import Github.Data
import Github.Api

-- | All the comments on a pull request with the given ID.
--
-- > pullRequestReviewComments "thoughtbot" "factory_girl" 256
pullRequestReviewComments :: String -> String -> Int -> IO (Either Error [Comment])
pullRequestReviewComments userName repoName number =
  githubGet ["repos", userName, repoName, "pulls", show number, "comments"]

-- | One comment on a pull request, by the comment's ID.
--
-- > pullRequestReviewComment "thoughtbot" "factory_girl" 301819
pullRequestReviewComment :: String -> String -> Int -> IO (Either Error Comment)
pullRequestReviewComment userName repoName id =
  githubGet ["repos", userName, repoName, "pulls", "comments", show id]
