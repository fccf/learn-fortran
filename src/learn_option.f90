module option

  implicit none

contains

  subroutine get_option(option,arg,found)
    !< get option for integer, real, logical, character(*)
    character(*),intent(in)      :: option
    class(*),intent(out)         :: arg
    logical,intent(out),optional :: found

    integer :: argc
    character(32),allocatable :: argv(:)
    integer :: i
    logical :: found_ = .false.

    ! arg  = 0
    argc = command_argument_count()
    if(argc /=0) then
      allocate(argv(argc))
    end if


    do i = 1,argc
      call get_command_argument(i,argv(i))
    end do

    do i = 1,argc
      if(option == trim(adjustl(argv(i)))) then
        select type (arg)
        type is(integer)
          read(argv(i+1),*) arg
        type is(real)
          read(argv(i+1),*) arg
        type is(logical)
          read(argv(i+1),*) arg
        type is(character(*))
          read(argv(i+1),*) arg
        class default
            error stop "unknow option type"
        end select

        found_ = .true.
        exit
      end if
    enddo

    if(present(found)) found = found_

  end subroutine get_option

end module option

program main
  use option
  implicit none
  integer :: is
  real    :: rs
  logical :: ls
  character(8) :: cs

  call get_option('-is',is)
  call get_option('-ls',ls)
  call get_option('-rs',rs)
  call get_option('-cs',cs)

  print*, 'is = ',is
  print*, 'rs = ',rs
  print*, 'ls = ',ls
  print*, 'cs = ',cs


end program main
