program Newton
  real(8) :: x0, x, f, df
  integer :: iter

  x0 = 2.0 !define initial guess

  do iter = 1, 10 !it basically a for loop
    f = x0**3 - 5.0 !define a function of your choice, as well as its derivative
    df = 3.0 * x0**2

    x = x0 - f / df !Netwon's formula

    if (abs(x - x0) < 1.0E-6) exit !exit is a similar version of break in python
    x0 = x
  end do

  print *, "Approximate root:", x 

end program Newton
