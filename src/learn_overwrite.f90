program learn_overwrite
  use iso_c_binding
  implicit none
  integer :: i
  integer :: info
  integer, parameter :: n = 100

  interface
    function doSleep(usec) result(e) bind(C,name='usleep')
      use iso_c_binding
      integer(c_int),value::usec
      integer(c_int)::e
    end function doSleep
  end interface

  do i = 1, n
    write(*,'(a,f6.2,a)',advance='no') char(13),100*i/real(n),'%'
    info = doSleep(100000)
  enddo
  write(*,*)


end program learn_overwrite
