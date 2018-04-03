#include "debug.h"
program learn_debug
  use debug
  implicit none

  call t1
  ! call t2
  call t3

contains
  subroutine t1

    integer :: dbg_level = 2
    integer :: l
    call set_debug_level(dbg_level)
    info(0,'(a,i0)') 'debug level is: ',dbg_level
    l = 0; info(l,'(a,i0)') 'info level is: ',l
    l = 1; info(l,'(a,i0)') 'info level is: ',l
    l = 2; info(l,'(a,i0)') 'info level is: ',l
    l = 3; info(l,'(a,i0)') 'info level is: ',l

  end subroutine t1

  subroutine t2
    error("this is an error.")
  end subroutine t2

  subroutine t3
    assert(1==1)
    assert(1==2)
  end subroutine t3

end program learn_debug
