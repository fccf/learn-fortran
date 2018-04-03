program learn_doconcurrent

  implicit none

  integer, parameter :: n = 5
  integer :: i
  real :: a(n),c(n)

  forall(i=1:n)
    a(i) = real(i)
  endforall

  do concurrent (i = 1:n)
    block
      real :: r
      r= a(i)**2
      c(i) =  sqrt(r)
    end block
  end do

  if(all(a==c)) print*, 'pass'

end program learn_doconcurrent
