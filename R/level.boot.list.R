#' Generate a list of id level bootstrap samples
#'
#' @description Re-samples data at the id level to form a list of dataframes.May be used to re-sample whole participants or groups.
#'
#' @param df The dataframe to be re sampled.
#' @param id The variable in the dataframe to be re-sampled
#' @param B The number of bootstrap samples to generate.
#'
#' @return A list of dataframes.
#'
#' @importFrom dplyr distinct pull semi_join tibble
#' @importFrom purrr map
#'
#' @export
level.boot.list <- function(df, id, B) {
  id <- rlang::ensym(id)

  # unique IDs to sample from
  ids <- df %>% distinct(!!id) %>% pull(!!id)

  # generate B bootstrap samples
  map(seq_len(B), function(b) {
    sampled_ids <- sample(ids, size = length(ids), replace = TRUE)

    df %>%
      semi_join(tibble(!!id := sampled_ids), by = rlang::as_string(id)) %>%
      mutate(.bootstrap = b)
  })
}
