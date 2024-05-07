.onLoad <- function (libname, pkgname) {
  dyn.load(system.file("libs/x64/olapR.dll", package = "olapR"))
}
