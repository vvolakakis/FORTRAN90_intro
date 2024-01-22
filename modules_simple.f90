module MathOperations
  implicit none
  private

  public :: calculate_average

contains

  subroutine calculate_average(data, n, average)
    real(kind=8), intent(in), dimension(:) :: data
    integer, intent(in) :: n
    real(kind=8), intent(out) :: average

    integer :: i
    average = 0.0

    do i = 1, n
      average = average + data(i)
    end do

    average = average / real(n)
  end subroutine calculate_average

end module MathOperations

program ModuleProcedureExample
  use MathOperations
  implicit none

  real(kind=8), dimension(5) :: values = [1.0, 2.0, 3.0, 4.0, 5.0]
  real(kind=8) :: avg

  call calculate_average(values, 5, avg)

  print *, "Average:", avg

end program ModuleProcedureExample
