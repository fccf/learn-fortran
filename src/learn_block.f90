program learn_block

  implicit none

  real :: i

  i = 30.0

  block
    integer :: i
    do i = 1,3
      print*, i
    enddo
  end block

  print*, i

end program learn_block
