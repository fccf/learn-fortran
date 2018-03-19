module learn_sleep
  use iso_c_binding
  implicit none

  interface
    subroutine usleep(us) bind(c)
      import c_int
      integer(c_int), value :: us
    end subroutine

    ! function doSleep(usec) result(e) bind(C,name='usleep')
    !   use iso_c_binding
    !   integer(c_int),value::usec
    !   integer(c_int)::e
    ! end function doSleep
  end interface

contains

  subroutine wait(sec)
    real,intent(in)::sec !< time to sleep in seconds
    integer(c_int)::usec
    usec = nint(sec*1.0E6)
    call  usleep(usec)
  end subroutine wait


end module learn_sleep

program main
  use learn_sleep
  implicit none
  integer :: i

  do i = 1, 100
    write(*,'(a,f6.2,a)',advance='no') char(13),real(i),'%'
    call wait(0.05)
  enddo
  write(*,*)


end program main
