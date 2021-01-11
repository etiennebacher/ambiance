#' Define a list of ambiances
#'
#' This function creates a CSV file that contains a list of ambiances. The CSV file is then called by `ambiance()` to apply specific themes.
#'
#' @param ambiances This must be a list of vectors. Each vector should have two components: a name and a theme. See `Examples` for more details.
#'
#' @return Creates a CSV file stored where the package is stored.
#' @export
#'
#' @examples
#' \dontrun{
#' define_ambiances(
#'   list(
#'     c("perso", "cobalt"),
#'     c("class", "textmate (default)")
#'   )
#' )
#' }
define_ambiances <- function(ambiances) {

  stopifnot(class(args) == "list")

  # Convert inputs as dataframe
  x <- as.data.frame(args)

  z <- data.frame("", "")
  colnames(z) <- c("ambiance_name", "theme_name")
  for (i in 1:ncol(x)) {
    z[i, ] <- x[, i]
  }

  write.csv(
    x = z,
    file = system.file("ambiances.csv", package = "ambiance")
  )

}
