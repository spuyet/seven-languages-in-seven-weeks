division := Number getSlot("/")
Number / = method(other, if(other == 0, 0, division(other)))
List myAverage := method(reduce(+, 0) / size)

a := list(42, 3, 90)
a myAverage println
list myAverage println
