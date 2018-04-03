
module debug
  use, intrinsic :: iso_fortran_env, only: output_unit, error_unit
  implicit none

  public :: set_debug_level, debug_unit, debug_error, debug_level_

  private

  integer, save :: debug_level_  = 1

contains
  !=============================================================================
  subroutine set_debug_level(level)
    !< set debug_level_, only print `level<debug_level_` information
    integer,intent(in) :: level
    debug_level_ = level
  end subroutine set_debug_level
  !=============================================================================
  function debug_unit(unit)
    !< choose where to print, level<1',print to `ERROR_UNIT`, else print to `OUTPUT_UNIT`
    integer, intent(in) :: unit
    integer :: debug_unit
    if(unit<1) then
       debug_unit = error_unit
    else
       debug_unit = output_unit
    end if
  end function debug_unit
  !=============================================================================
  subroutine debug_error(msg,file,line)
    !< print error message, contains which file and line
    character(*), intent(in) :: msg,file
    integer, intent(in) :: line
    character(8) :: ls
    write(ls,'(i0)') line
    write(error_unit,*)              '# Error'
    write(error_unit,'(1x,3a,i0,a)') 'Source loction: (' //  file//', '// trim(ls)//' )'
    write(error_unit,*)              'Error message : '//msg
    stop
  end subroutine debug_error

end module debug
