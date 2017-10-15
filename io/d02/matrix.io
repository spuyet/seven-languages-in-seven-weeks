Matrix := List clone

Matrix dim := method(x, y, setSize(y) mapInPlace(_, list setSize(x) mapInPlace(_, 0)))
Matrix set := method(x, y, v, at(y) atPut(x, v))
Matrix get := method(x, y, at(y) at(x))
Matrix transpose := method(
  other := self clone dim(size, at(0) size)
  foreach(i, y, y foreach(j, v, other set(i, j, v)))
  other
)
Matrix write := method(output,
  if(call message argAt(0), nil, output = File standardOutput)
  foreach(i, y,
    y foreach(j, v,
      output write(v asString)
      output write(if((y size) - 1 == j, "\n", " "))
    )
  )
)
Matrix read := method(input,
  if(call message argAt(0), nil, input = File standardInput)

  lines := input readLines map(v, v split(" "))
  dim(lines first size, lines size)
  lines foreach(i, line, line foreach(j, v, set(j, i, v)))
  self
)
Matrix writeToFile := method(filename,
  file := File clone openForUpdating(filename)
  self write(file)
)
Matrix readFromFile := method(filename,
  file := File clone openForReading(filename)
  self read(file)
)

m := Matrix clone
m dim(3, 5)
m set(1, 2, 42)
m get(1, 2) write
m transpose write
m writeToFile("matrix.txt")
m readFromFile("matrix.txt") write
m read
