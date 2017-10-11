fibo := method(n,
  if(n < 2, return 1)
  n1 := 0
  n2 := 1
  tmp := 0
  (n - 1) repeat(
    tmp = n1
    n1 = n2
    n2 = tmp + n1
  )
  n2
)

fibo(10) println
