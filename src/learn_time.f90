module time
  use iso_c_binding
  implicit none

  interface
    function doSleep(usec) result(e) bind(C,name='usleep')
      use iso_c_binding
      integer(c_int),value::usec
      integer(c_int)::e
    end function doSleep
  end interface

contains

  function wall_time() result(o) !< Return the wall time
    real :: o
    integer :: ticks, rate
    call system_clock(ticks,rate)
    o = real(ticks/rate)
  end function wall_time

  subroutine wait(sec)
    real,intent(in)::sec !< time to sleep in seconds
    integer(c_int)::usec
    integer(c_int)::ret
    usec = nint(sec*1.0E6)
    ret  = doSleep(usec)
  end subroutine wait

  elemental function s2hms(sec) result(hms)
    !< return seconds to h:m:s string
    real, intent(in) :: sec
    character(:), allocatable :: hms
    integer :: hi,mi,si
    character(3) :: hs,ms,ss

    si = nint(sec)
    hi = int(si/3600)
    si = si - 3600*hi
    mi = int(si/60)
    si = si - 60*mi

    write(hs,'(i0)') hi
    write(ms,'(i0)') mi
    write(ss,'(i0)') si
    hms = trim(adjustl(hs))//'h:'//trim(adjustl(ms))//'m:'//trim(adjustl(ss))//'s'

  end function s2hms


  function now()
    !< return time now as a string
    character(:), allocatable :: now

    integer :: y,m,d,h,n,s,values(8)
    character(len=10) :: date
    character(len=8)  :: time

    call date_and_time ( values = values )

    y = values(1)
    m = values(2)
    d = values(3)
    h = values(5)
    n = values(6)
    s = values(7)

    write(date,'(i0,a,i0,a,i0)') y,'-',m,'-',d
    write(time,'(i0,a,i0,a,i0)') h,':',n,':',s

    now = trim(adjustl(date))//' '//trim(adjustl(time))

  end function now

end module time

program main
  use time
  implicit none
  real :: t, dt

  t = wall_time()
  call sleep(1)
  dt = wall_time() - t

  print*, now()
  print*, s2hms(dt)

end program main
