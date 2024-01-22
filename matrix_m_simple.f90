program LargeMatrixMultiplication
  implicit none
  real(kind=8), dimension(:,:), allocatable :: matrixA, matrixB, result
  integer :: n, i, j, k
  real :: time_begin, time_end
  call CPU_TIME(time_begin)

  ! Set the size of the matrices
  n = 1000

  ! Allocate memory for matrices
  allocate(matrixA(n, n), matrixB(n, n), result(n, n))

  ! Initialize matrices with random values (for demonstration purposes)
  call random_number(matrixA)
  call random_number(matrixB)


  ! Perform matrix multiplication
  do i = 1, n
    do j = 1, n
      result(i, j) = 0.0
      do k = 1, n
        result(i, j) = result(i, j) + matrixA(i, k) * matrixB(k, j)
      end do
    end do
  end do

  call CPU_TIME (time_end)
  print *, 'Elapsed time is ', time_end - time_begin

  ! Deallocate memory
  deallocate(matrixA, matrixB, result)

end program LargeMatrixMultiplication
