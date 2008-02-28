//
// The most trivial Yown app
//
doRelativeFile("../yown.io")

YownSimple := Yown clone do(
  get("/test",
    html(
      title("Hello??")
      h1("THIS IS A TEST")
    )
  )
) run
