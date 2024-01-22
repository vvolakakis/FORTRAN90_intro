program simpleex
  implicit none

  type :: Person
    character(len=50) :: name
    integer :: age
    real(kind=8) :: height
  end type Person

  type(Person), dimension(:), allocatable :: people

  integer :: num_people, i

  print *, "Enter the number of people:"
  read *, num_people

  allocate(people(num_people))   !so you have to allocate memory for the array you are going to use, nothing is easy here folks

  do i = 1, num_people
    print *, "Enter details for person ", i
    read *, people(i)%name, people(i)%age, people(i)%height
  end do

  print *, "Details of people:"
  do i = 1, num_people
    print *, "Person ", i, ":", trim(people(i)%name), people(i)%age, people(i)%height
  end do

  deallocate(people) !dont forget to deallocate the captured memory

end program simpleex

