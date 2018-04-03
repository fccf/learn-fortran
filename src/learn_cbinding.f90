program learn_cbinding
  use iso_c_binding
  implicit none

  interface
    ! subroutine usleep(us) bind(c)
    !   import c_int
    !   integer(c_int), value :: us
    ! end subroutine

    function doSleep(usec) result(e) bind(C,name='usleep')
      use iso_c_binding
      integer(c_int),value::usec
      integer(c_int)::e
    end function doSleep
  end interface

  integer :: info
  real    :: t1, t2, dt

  t1 = wtime()
  ! call usleep(nint(1E6))
  info = doSleep(nint(1E6))
  t2 = wtime()
  dt = t2 - t1
  print"(a,f5.3,a)", 'Time elapse: ',dt, ' seconds'
  ! info = doSleep(nint(1E6))
  call sleep(1)
  t1 = wtime();dt = t1 - t2
  print"(a,f5.3,a)", 'Time elapse: ',dt, ' seconds'

contains

  function wtime() result(o) !< Return the wall time
    real :: o
    integer :: count
    real    :: rate
    call system_clock(count,rate)
    o = count/rate
  end function wtime

end program learn_cbinding
