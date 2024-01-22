program montecarlo
  integer, parameter :: N = 100000 !you have to declare everything, 
  real(8) :: x, y, integral, sum
  integer :: i

  sum = 0.0

  call random_seed() !just to change the sequence of random numbers that we will be given below, nothing crazy
  do i = 1, N
    call random_number(x)
    call random_number(y)
    sum = sum + exp(-x**2 - y**2)
  end do
  integral = sum / N

  integral = integral * 4.0
  print *, "Approximate value of the integral:", integral

end program montecarlo
