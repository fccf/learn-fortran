program learn_recursive

  implicit none

  integer :: n = 5

  print*, 'n! = ',fact(n)

contains
  recursive function fact(n) result(res)
    integer, intent(in) :: n
    integer :: res

    if(n<=0) then
      res = 1
    else
      res = n*fact(n-1)
    endif

  end function fact

end program learn_recursive
