# tools/vendor-openapi.R
# Downloads the MOTIS OpenAPI spec from the upstream repository.
# Run from the package root: source("tools/vendor-openapi.R")
# Shell alternative: bash tools/vendor-openapi.sh

spec_url <- "https://raw.githubusercontent.com/motis-project/motis/master/openapi.yaml"
commits_url <- "https://api.github.com/repos/motis-project/motis/commits?path=openapi.yaml&per_page=1"
spec_path <- "tools/openapi.yaml"
meta_path <- "tools/openapi.yaml.remote"

# Download spec
download.file(spec_url, spec_path, quiet = TRUE)

# Record upstream commit that last touched this file
commit_info <- jsonlite::fromJSON(commits_url)
writeLines(
  c(
    paste("commit:", commit_info$sha[1]),
    paste("date:", commit_info$commit$committer$date[1]),
    paste("vendored:", Sys.time())
  ),
  meta_path
)

message("Vendored from commit ", substr(commit_info$sha[1], 1, 7))
message("Review changes: git diff tools/openapi.yaml")
