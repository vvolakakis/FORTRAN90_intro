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
  
  call arrays() !calling the subroutine averages, which has no input from the main program, therefore ()
  
  contains !need to put the subroutine at the end, and the call of the subroutine before, since whatever is below the contains sections cannot be an external operation, but only related to the subroutine
	subroutine arrays()
		implicit none
		!lets create a couple of arrays as well. Many ways to handle them, just a few here, only schratching the surface again (sorry for any vocab mistakes if any)
		!static memory allocation
		integer, dimension(4) :: arr_ena !1-d array declaration, could also be: integer :: arr_ena(10)
		integer, dimension(4, 4) :: arr_duo !2-d array declaration
		
		!dynamic memory allocation
		integer, allocatable :: arr_one2(:)
		integer, allocatable :: arr_duo2(:,:)
		
		character(:), allocatable :: name_f!with strings pretty much the same idea, can allocate "on the way" though here
		character(:), allocatable :: name_l

		allocate(arr_one2(4)) !dynamic yes, but still we have to allocate at some point in the code the dimensions, so it can still be a bit frustrating
		allocate(arr_duo2(4,4))
		
		arr_one2 = [5,7,32,4]  !just assigning some numbers, another way: array1 = [(i, i = 1, 4)]
		
		print *, arr_one2
		deallocate(arr_one2) !need to deallocate the memory, i.e. free the memory back (not the end of the world if you dont but..)
		deallocate(arr_duo2)
		
		allocate(character(6) :: name_f) 
		name_f = 'Nobody' !thats one way, the other way, simpler and easier can be seen below, allocation on the way
		name_l = 'Someone' 
		print *, name_f//' '//name_l
	end subroutine arrays
end program moduless !can't have multiple main programs, but you can have multiple modules, functions, etc.

!time for a function
integer function factorial(k) !need to declare the nature of the function, what is being given back from the function, name same as the return
	implicit none
	integer, intent(in) :: k
	integer :: i, bamboom
	bamboom = 1
	do i = 1, k
		bamboom = bamboom*i
	end do
	factorial = bamboom
end function factorial
