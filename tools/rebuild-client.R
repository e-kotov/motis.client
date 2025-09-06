# library(openapi3)
openapi3::oa3_generate_client(
  spec = "tools/openapi.yaml",
  default_return_as = "raw",
  default_build_only = TRUE,
  default_server = "http://localhost:8080",
  fun_prefix = "mc",
  # default_user_agent = "motis.client R package, https://github.com/e-kotov/motis.client/",
  out_file = "R/",
  split_files = TRUE
)
# ?oa3_build_operations()
rdocdump::rdd_to_txt(".", file = "private/motis.client.txt")
# devtools::install()
