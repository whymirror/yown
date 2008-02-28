//
// Yown WebServer
// starts on port 8010
//
// The Socket stuff has been pretty unstable in Io, so be
// sure you're running the latest pull.  Or step back a few
// days maybe?
//
MyHandler := WebRequest clone do(
  handleRequest := method(request,
    self sendResponse (200, "OK")
    self sendHeader ("Content-type", "text/HTML")
    self endHeaders ()
    self send(app handleRequest(request))
    self close
  )
)

WebServer := Server clone do(
  setPort(8010)
  handleSocket := method(aSocket,
    handler := Yown MyHandler clone
    handler app := app
    handler @handleSocket(aSocket)
  )
  run := method(app,
    self setSlot("app", app)
    start
  )
)
