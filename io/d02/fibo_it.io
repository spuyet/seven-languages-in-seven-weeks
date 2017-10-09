fibo := method(n,
  prev := 0
  curr := 1
  for(i, 1, n - 1,
    tmp := curr
    curr := tmp + prev
    prev := tmp
  )
  curr
)

fibo(10) println
