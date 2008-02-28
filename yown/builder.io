//
// Yown Builder
// html construction kit
//
Builder := Object clone
Builder tag := method(name, nodes,
  inner := ""
  attrs := name split(".")
  if (attrs size > 1,
    name := attrs at(0)
    attrs := " class='" .. attrs slice(1) join(" ") .. "'",
    attrs := ""
  )
  while(nodes,
    if(nodes name != ";",
      inner = inner .. if(nodes argCount > 0, 
        tag(nodes name, nodes argAt(0)), 
        doMessage(nodes))
    )
    nodes = nodes next
  )
  "<#{name}#{attrs}>#{inner}</#{name}>" interpolate
)

Builder forward := method(
  tag(call message name, call message argAt(0))
)
