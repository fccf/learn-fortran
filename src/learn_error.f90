module learn_error
  use iso_fortran_env, only: eunit_ => error_unit
  implicit none

contains
  subroutine error(msg,file,line)
    character(*), intent(in) :: msg,file
    integer, intent(in) :: line
    character(5) :: lc

    write(lc,'(i0)') line

    write(eunit_,*) '# Error'
    write(eunit_,*) 'Source loction: ('//file//','//trim(lc)//')'
    write(eunit_,*) 'Error message : '//msg

    stop
  end subroutine error

end module learn_error

#define err(x) call error(x,__FILE__,__LINE__)

program main
  use learn_error
  implicit none

  err('this is an error')

end program main
