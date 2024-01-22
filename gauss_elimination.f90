program GaussianElimination
  integer, parameter :: N = 3
  real(8) :: A(N,N+1), X(N)
  integer :: i, j, k
  real(8) :: factor

  ! Initialize augmented matrix [A|B]
  A(:,1:N) = reshape([2.0, -1.0, 1.0, 8.0, -3.0, 2.0, 4.0, 1.0, -1.0, 3.0], [N, N])

  ! Augment matrix with right-hand side values
  A(:,N+1) = [8.0, 4.0, 3.0]

  ! Perform Gaussian elimination
  do k = 1, N-1
    do i = k+1, N
      factor = A(i,k) / A(k,k)
      A(i,k+1:N+1) = A(i,k+1:N+1) - factor * A(k,k+1:N+1)
    end do
  end do

  ! Back-substitution
  do i = N, 1, -1
    X(i) = A(i,N+1) / A(i,i)
    do j = i+1, N
      X(i) = X(i) - A(i,j) * X(j)
    end do
  end do

  ! Print the solution
  print *, "Solution to the system of equations:"
  print *, X

end program GaussianElimination
