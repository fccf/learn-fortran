program learn_associate

  implicit none

  real :: x = 3.,y=4.
  associate(r=>sqrt(x*x+y*y))
    print*,'r = ',r
    x = 9;y=16
    print*,'r = ',r
  end associate

  associate(r=>x)
    print*,'r = ',r
    x = 81
    print*,'r = ',r
  end associate

end program learn_associate
