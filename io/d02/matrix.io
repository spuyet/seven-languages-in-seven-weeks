Matrix := List clone

Matrix dim := method(x, y, setSize(y) mapInPlace(_, list setSize(x)))
Matrix set := method(x, y, v, at(y) atPut(x, v))
Matrix get := method(x, y, at(y) at(x))
Matrix transpose := method(
  other := clone dim(size, at(0) size)
  foreach(i, y, y foreach(j, v, other set(j, i, v)))
  other
)

m := Matrix clone

m dim(3, 5) println
m set(1, 2, 42)
m get(1, 2) println
m println
m transpose println
