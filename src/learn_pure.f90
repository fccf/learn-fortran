program learn_pure
  implicit none

  if(add('foo','bar') == 'foobar') print*, 'pass'

contains
  pure function add(a,b) result(c)
    character(*), intent(in) :: a, b
    character(:), allocatable :: c
    c = a // b
  end function add

end program learn_pure
