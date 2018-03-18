module learn_show_progress
  use iso_c_binding
  use iso_fortran_env
  implicit none

  interface
    function doSleep(usec) result(e) bind(C,name='usleep')
      use iso_c_binding
      integer(c_int),value::usec
      integer(c_int)::e
    end function doSleep
  end interface


contains
  subroutine sleep(sec)
    real,intent(in)::sec
    integer(c_int)::usec
    integer(c_int)::ret
    usec = nint(sec*1.0E6)
    ret  = doSleep(usec)
  end subroutine sleep

  subroutine show_progress(p)
    real,intent(in)::p
    !! Progress fraction \(p\in[0,1]\), 0 = start progress 1 = complete progress
    integer :: i
    integer :: n = 80
    real    ::r
    character(3) :: persent
    write(persent,'(i0)') int(p*100)

    write(output_unit,'(a)',advance='no') achar(13)//' ['
    do i=1,80
      r = real(i-1)/real(N-1)
      if(r<=p) then
        write(output_unit,'(1a)',advance='no') '='
      else
        write(output_unit,'(1a)',advance='no') ' '
      endif

    end do
    write(output_unit,'(a)',advance='no') '] '//trim(persent)//' %'
    flush(output_unit)
  end subroutine show_progress

end module learn_show_progress

program main
  use learn_show_progress
  implicit none
  integer :: n

  write(output_unit, *) 'initialize progress'
  do n = 1,100
    call sleep(0.1)
    call show_progress(n/100.0)
  enddo
  write(output_unit,*)

end program main
