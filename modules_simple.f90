module modulaki !simple way to go into modules. Modules could be compared with functions, but in general they are a way to create more structured and cleaner code, again, nothing crazy
  implicit none !basically tell the compiler that all variables are explicitely declared, if you dont use that the compiler might take a variable starting (in name) with I as an integer, regardless of what you want -
  !(pardon any vocab mistakes if any)
  private !meaning that it can be used only inside this module and not outside of it

  public :: calculate_boom !this is like global designation of a variable in python

contains

  subroutine calculate_average(data, n, boom)
    real(kind=8), intent(in), dimension(:) :: data !here folks we have to declare everything, even the air we breath needs to be declared (like C)
	!But lets see what the hell line 11 does: 
	!real(kind=8) declares data as a real variable with 8-byte precision (double precision)
	!intent(in) basically we are asked the reason of using data (like when you come to the U.S. customs, you are being asked every single thing), and it means that data is an input variable
	!dimension(:) indicates that data is an array with an unspecified size, not fixed at the point of declaration and can be determined later
	
    integer, intent(in) :: n
    real(kind=8), intent(out) :: boom

    integer :: i
    boom = 0.0

    do i = 1, n
      boom = boom + data(i)
    end do

    boom = boom / real(n)
  end subroutine calculate_average

end module modulaki

program moduless
  use modulaki
  implicit none

  real(kind=8), dimension(5) :: values = [1.0, 2.0, 3.0, 4.0, 5.0]
  real(kind=8) :: mpam

  call calculate_average(values, 5, mpam)

  print *, "boom:", mpam

end program moduless
