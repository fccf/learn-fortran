program learn_recursive
  implicit none
  integer :: n = 5

  if(fact(n)==120) print*, 'pass'

contains
  recursive function fact(n) result(r)
    integer, intent(in) :: n
    integer :: r

    if(n<=0) then
      r = 1
    else
      r = n*fact(n-1)
    endif
  end function fact

end program learn_recursive
