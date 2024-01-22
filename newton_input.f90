program newtonpali
  real(8) :: x0, x, f, df
  integer :: iter
  write(*,*) "Enter initial guess for the root:"
  read(*,*) x0

  do iter = 1, 10
    f = x0**3 - 5.0
    df = 3.0 * x0**2
    x = x0 - f / df
    if (abs(x - x0) < 1.0E-6) exit
    x0 = x
  end do
  print *, "Approximate root:", x

end program newtonpali
