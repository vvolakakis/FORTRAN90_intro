program MonteCarloIntegration
  integer, parameter :: N = 100000
  real(8) :: x, y, integral, sum
  integer :: i

  ! Initialize sum
  sum = 0.0

  ! Initialize random seed
  call random_seed()

  ! Generate random points and evaluate the function
  do i = 1, N
    call random_number(x)
    call random_number(y)
    sum = sum + exp(-x**2 - y**2)
  end do

  ! Calculate the integral
  integral = sum / N

  ! Multiply by the area of integration
  integral = integral * 4.0

  ! Print the result
  print *, "Approximate value of the integral:", integral

end program MonteCarloIntegration
