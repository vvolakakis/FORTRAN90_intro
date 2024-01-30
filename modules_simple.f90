module modulaki !simple way to go into modules. Modules could be compared with functions, but in general they are a way to create more structured and cleaner code, again, nothing crazy
  implicit none !basically tell the compiler that all variables are explicitely declared, if you dont use that the compiler might take a variable starting (in name) with I as an integer, regardless of what you want -
  !(pardon any vocab mistakes if any)
  private !meaning that it can be used only inside this module and not outside of it

  public :: calculate_average !this is like global designation of a variable in python

  contains !used to define internal subprograms, like a subroutine or  a function within the main program or a module

  subroutine calculate_average(data, n, boom)
    real(kind=8), intent(in), dimension(:) :: data !here folks we have to declare everything, even the air we breath needs to be declared (like C)
	!But lets see what the hell line 11 does: 
	!real(kind=8) declares data as a real variable with 8-byte precision (double precision)
	!intent(in) basically we are asked the reason of using data, and it means that data is an input variable
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
  
  integer factorial !need to declare the function's output type

  real(kind=8), dimension(5) :: values = [1.0, 2.0, 3.0, 4.0, 5.0] !we also have to declare the length of our structure from the begining 
  real(kind=8) :: mpam
  integer :: y
 
  print *, "provide the number that you want to calculate its factorial"
  read *, y
  print *, "function check", factorial(y)
  
  call calculate_average(values, 5, mpam)
  print *, "average value of list:", mpam
end program moduless

integer function factorial(k) !there is a difference compared to the above function
	implicit none
	integer, intent(in) :: k
	integer :: i, bamboom
	bamboom = 1
	do i = 1, k
		bamboom = bamboom*i
	end do
	factorial = bamboom
end function factorial