module learn_parse

  implicit none

contains
  function parse_iv(s) result(v)
    character(*), intent(inout) :: s
    integer, allocatable :: v(:)

    integer :: n, i
    n = 0
    do i = 1, len(s)
      if(s(i:i)=='[' .or. s(i:i)== ']') s(i:i) = ' '
      if(s(i:i)==',') n = n+1
    end do
    n = n+1
    !
    allocate(v(n))
    read(s,*) v

  end function parse_iv

  function parse_im(s) result(m)
    character(*), intent(inout) :: s
    integer, allocatable :: m(:,:)

    integer :: nr, nc, n, i
    nr = 0
    nc = 0
    n = 0
    do i = 1, len(s)
      if(s(i:i)=='[' .or. s(i:i)== ']') s(i:i) = ' '
      if(s(i:i)==',') n = n+1
      if(s(i:i)==';') nr = nr + 1
      if(s(i:i)== new_line('a')) nr = nr + 1
    end do
    nr = nr+1
    n = n+nr
    nc = n/nr

    allocate(m(nr,nc))
    read(s,*) m

  end function parse_im

  function parse_rv(s) result(v)
    character(*), intent(inout) :: s
    real, allocatable :: v(:)

    integer :: n, i
    n = 0
    do i = 1, len(s)
      if(s(i:i)=='[' .or. s(i:i)== ']') s(i:i) = ' '
      if(s(i:i)==',') n = n+1
    end do
    n = n+1

    allocate(v(n))
    read(s,*) v

  end function parse_rv

  function parse_rm(s) result(m)
    character(*), intent(inout) :: s
    real, allocatable :: m(:,:)

    integer :: nr, nc, n, i
    nr = 0
    nc = 0
    n  = 0
    do i = 1, len(s)
      if(s(i:i)=='[' .or. s(i:i)== ']') s(i:i) = ' '
      if(s(i:i)==',') n = n+1
      if(s(i:i)==';') nr = nr + 1
      if(s(i:i)== new_line(' ')) nr = nr + 1
    end do
    nr = nr+1
    n = n+nr
    nc = n/nr

    allocate(m(nr,nc))
    read(s,*) m

  end function parse_rm

end module learn_parse

program main
  use learn_parse
  implicit none

  integer, allocatable :: iv(:), im(:,:)
  real, allocatable    :: rv(:), rm(:,:)

  character(:), allocatable :: s
  integer :: i

  s= '[1,2,3,4]'

  iv = parse_iv(s)
  rv = parse_rv(s)

  print*, iv
  print*, rv

  s= '[1,2;3,4]'

  im = parse_im(s)
  do i = 1,size(im,1)
    print*, im(i,:)
  enddo

  ! s= '[[1.,2.];[3.,4.]]'
  s = '1.,2.'//new_line('a')//'3.,4.'
  rm = parse_rm(s)
  do i = 1,size(rm,1)
    print*, rm(i,:)
  enddo

end program main
