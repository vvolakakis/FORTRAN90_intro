module modulaki !simple way to go into modules. Modules could be compared with functions, but in general they are a way to create more structured and cleaner code, again, nothing crazy
  implicit none !basically tell the compiler that all variables are explicitely declared, if you dont use that the compiler might take a variable starting (in name) with I as an integer, regardless of what you want it to be -
  !(pardon any vocab mistakes if any)
  private !meaning that it can be used only inside this module and not outside of it

  public :: calculate_average !this is like global designation of a variable in python

  contains !used to define internal subprograms, like a subroutine or  a function within the main program or a module

  subroutine calculate_average(data, n, boom) !subroutines are very similar to functions, but you can use them when there is nothing to be returned by the function (if its a function, it needs to be returning something)
    real(kind=8), intent(in), dimension(:) :: data !here folks we have to declare everything, even the air we breath needs to be declared (like C)
	!But lets see what the hell line 11 does: 
	!real(kind=8) declares data as a real variable with 8-byte precision (double precision) - no need for kind, and if we just have real, its singe precision
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

  real(kind=8), dimension(8) :: values = [23, 25, 21, 29, 28, 23, 26, 27] !we also have to declare the length of our structure from the begining 
  real(kind=8) :: mpam
  
  call calculate_average(values, 5, mpam)
   print '("Average age of the people in our office:"/(2F8.2))', mpam 

end program moduless !can't have multiple main programs, but you can have multiple modules, functions, etc.

