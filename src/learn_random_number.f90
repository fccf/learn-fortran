program learn_random_number

  implicit none
  integer, parameter :: n = 4
  real :: a(n,n),b(n,n)
  integer :: i

  call random_number(a)
  where(a>0)
    b =1.
  elsewhere(a<0)
    b = -1.
  elsewhere
    b =0.
  end where

  print '(4(f15.7))', (a(i,:),i=1,n)
  print '(4(f15.7))', (b(i,:),i=1,n)

end program learn_random_number
