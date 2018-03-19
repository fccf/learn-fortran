program learn_array

  implicit none

  integer, allocatable :: iv(:)
  integer :: i, n = 10

  iv = [integer :: ]
  do i = 1, n
    iv = [iv,i]
  enddo

  print*,iv

end program learn_array
