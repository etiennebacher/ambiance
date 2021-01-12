#' Switch ambiance
#'
#' @param context Name of an ambiance among those defined with `define_ambiances`
#'
#' @return Change RStudio theme
#' @export
ambiance <- function(context) {

  if (!rstudioapi::isAvailable()) {
    stop("ambiance::ambiance() only works in RStudio")
  }

  if (!is.character(context)) {
    stop("context must be a character")
  }

  ambiances <- read.csv(
    system.file("ambiances.csv", package = "ambiance"),
    stringsAsFactors = FALSE
  )

  if (nrow(ambiances) == 0) {
    stop("You must create a list of ambiances with define_ambiances().")
  }

  if (!context %in% ambiances$ambiance_name) {
    stop(paste0('"', context, '" is not in the list of ambiances you defined.'))
  }

  choice <- subset(ambiances, ambiance_name == context)

  if (!choice$theme_name %in% names(rstudioapi::getThemes())) {
    stop("This theme doesn't exist.")
  }

  rstudioapi::applyTheme(as.character(choice$theme_name))

  # rstudioapi::restartSession()
  # some preferences in Rprofile might override the preferences set by ambiance()

}
