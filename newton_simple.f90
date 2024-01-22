program NewtonsMethod
  real(8) :: x0, x, f, df
  integer :: iter

  ! Initial guess
  x0 = 2.0

  ! Iterative process using Newton's method
  do iter = 1, 10
    ! Evaluate function and its derivative
    f = x0**3 - 5.0
    df = 3.0 * x0**2

    ! Update x using Newton's formula
    x = x0 - f / df

    ! Check for convergence
    if (abs(x - x0) < 1.0E-6) exit

    ! Update guess for the next iteration
    x0 = x
  end do

  ! Print the root
  print *, "Approximate root:", x

end program NewtonsMethod
