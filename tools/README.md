# tools/

Development scripts for maintaining the motis.client package. All R client code in `R/` is auto-generated from the vendored OpenAPI spec.

## Vendoring the OpenAPI spec

The file `openapi.yaml` is vendored from [motis-project/motis](https://github.com/motis-project/motis/blob/master/openapi.yaml). To pull the latest version, run one of:

```sh
# from the package root
bash tools/vendor-openapi.sh
```

```r
# from an R session in the package root
source("tools/vendor-openapi.R")
```

Both scripts download the spec and write `openapi.yaml.remote` recording the upstream commit SHA and date.

After vendoring, review changes with `git diff tools/openapi.yaml`.

## Regenerating the R client

Prerequisites (one-time):

```r
remotes::install_github("e-kotov/openapi3@spec")
```

Then regenerate:

```r
source("tools/rebuild-client.R")
```

This reads `tools/openapi.yaml` and overwrites all `R/mc_*.R` files and the documentation dump in `private/`. Review changes with `git diff R/`.

## Full update workflow

```sh
bash tools/vendor-openapi.sh          # 1. pull latest spec
```

```r
source("tools/rebuild-client.R")      # 2. regenerate client code
devtools::document()                   # 3. rebuild roxygen docs
devtools::check()                      # 4. verify package
```

## Files

| File | Purpose |
|------|---------|
| `openapi.yaml` | Vendored MOTIS OpenAPI spec (do not edit manually) |
| `openapi.yaml.remote` | Provenance metadata (upstream commit, date) |
| `vendor-openapi.sh` | Shell script to download the spec |
| `vendor-openapi.R` | R script to download the spec |
| `rebuild-client.R` | Regenerates `R/mc_*.R` from the spec |
