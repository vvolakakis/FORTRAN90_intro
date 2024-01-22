program Calculator
  real(8) :: num1, num2, result
  integer :: choice

  ! Get input from user
  write(*,*) "Enter the first number:"
  read(*,*) num1

  write(*,*) "Enter the second number:"
  read(*,*) num2

  ! Display menu
  write(*,*) "Select operation:"
  write(*,*) "1. Addition"
  write(*,*) "2. Subtraction"
  write(*,*) "3. Multiplication"
  write(*,*) "4. Division"
  write(*,*) "Enter choice (1-4):"
  read(*,*) choice

  ! Perform calculation based on user choice
  select case (choice)
    case (1)
      result = num1 + num2
      write(*,*) "Result of addition:", result
    case (2)
      result = num1 - num2
      write(*,*) "Result of subtraction:", result
    case (3)
      result = num1 * num2
      write(*,*) "Result of multiplication:", result
    case (4)
      if (num2 /= 0.0) then
        result = num1 / num2
        write(*,*) "Result of division:", result
      else
        write(*,*) "Error: Division by zero"
      end if
    case default
      write(*,*) "Invalid choice"
  end select

end program Calculator
