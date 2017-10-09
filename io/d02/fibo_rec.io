fibo := method(n,
  res := 1
  if(n > 2) then(
    res := fibo(n - 1) + fibo(n - 2)
  )
  res
)

fibo(10) println
