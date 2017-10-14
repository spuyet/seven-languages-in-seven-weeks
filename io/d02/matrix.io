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
  foreach(i, y,
    y foreach(j, v,
      output write(v asString)
      output write(if((y size) - 1 == j, "\n", " "))
    )
  )
)

Matrix print := method(self write(File standardOutput))
Matrix writeToFile := method(filename,
  file := File clone openForUpdating(filename)
  self write(file)
)

m := Matrix clone
m dim(3, 5)
m set(1, 2, 42)
m get(1, 2) println
m transpose println
m print
m writeToFile("matrix.txt")
