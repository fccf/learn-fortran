program learn_block
  implicit none

  real :: i, j = 20.

  i = 30.0

  block
    integer :: i
    do i = 1,3
      print*, i
    enddo
    print*,j
    j = 10.
  end block

  print*, i
  print*, j

end program learn_block
