module modulaki !simple way to go into modules. Modules could be compared with functions, but in general they are a way to create more structured and cleaner code, again, nothing crazy
  implicit none !basically tell the compiler that all variables are explicitely declared, if you dont use that the compiler might take a variable starting (in name) with I as an integer, regardless of what you want it to be -
  !(pardon any vocab mistakes if any)
  private !meaning that it can be used only inside this module and not outside of it

  public :: calculate_average !this is like global designation of a variable in python

  contains !used to define internal subprograms, like a subroutine or  a function within the main program or a module

  subroutine calculate_average(data, n, boom)
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
  integer :: y, alt, everest, rockies
  character(len=50) :: fav_place
 
  print *, "provide the number that you want to calculate its factorial"
  read *, y
  print *, "function check", factorial(y)
  
  call calculate_average(values, 5, mpam)
  print *, "Average age of the people in our office:", mpam
  write(*, '(f5.2)') mpam !can use write and print equally, but write has also file writing capabilities. Also, here, f5.2 is to keep the printed number in 2 decimals
  print '("Average age of the people in our office:"/(2F8.2))', mpam 
  
  print *, "What's the name of your favorite place in the world?"
  read(*, *) fav_place
  
  print *, "What's the altirude of that place?"
  read *, alt
  
  everest = 29032 !just a shilly example to go through if statements
  rockies = 14440
  if (alt /= everest) then
	print *, "that place isn't Everest"
	if (alt < everest .AND. alt > rockies) then
		print *, "Might not be Everest but, it's higher than the Rockies!"
    else if (alt == everest .OR. alt == rockies) then
        print *, "WoW! Have you actually been there?"
    else
        print *, "No Everest, no Rockies, but i am sure its equally and maybe even more beautiful!"
    end if
  else
	print *, 'It is Everest, wow'
  end if
  
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