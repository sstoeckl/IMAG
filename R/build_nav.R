build_meetings_tbl <- function(path = "data/meetings.yml") {
  tibble::as_tibble(yaml::read_yaml(path))
}
