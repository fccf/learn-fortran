module to_string

  implicit none


  interface to_str
    module procedure :: scalar_to_string, vector_to_string, matrix_to_string
  end interface to_str


contains
  function scalar_to_string(value) result(s)
    class(*), intent(in) :: value
    character(:), allocatable :: s
    character(32) :: ls

    select type(v_p => value)
    type is(integer)
      write(ls,'(i0)') v_p
      s = trim(adjustl(ls))
    type is(real)
      write(ls,fmt=*) v_p
      s = trim(adjustl(ls))
    type is(logical)
      if (v_p) then
        write(ls,'(a)') 'true'
      else
        write(ls,'(a)') 'false'
      end if
      s = trim(adjustl(ls))
    type is(character(*))
      s = trim(adjustl(v_p))

      class default
      write(ls,'(a)') '***'
      s = trim(adjustl(ls))
    end select

  end function scalar_to_string



  function vector_to_string(value, vsep) result(s)
    class(*), intent(in) :: value(:)
    character(*), intent(in), optional :: vsep
    character(:), allocatable :: s

    character(:),allocatable :: lsep
    ! logical   :: lshell = .true.
    integer :: n

    lsep = ','
    if(present(vsep)) lsep = vsep

    s = '['
    do n = 1, size(value)
      if (n > 1) s = s//lsep
      s = s // to_str(value(n))
    end do

    s = s// ']'

  end function vector_to_string



  function matrix_to_string(value, vsep, msep) result(s)
    class(*), intent(in) :: value(:,:)
    character(*), intent(in), optional :: vsep
    character(*), intent(in), optional :: msep

    character(:), allocatable :: s

    character(:),allocatable :: lvsep, lmsep
    integer   :: n, m
    lvsep = ','
    lmsep = ';'
    if(present(vsep)) lvsep = vsep
    if(present(msep)) lmsep = msep

    s = '['
    do n = 1, size(value,2)
      if (n > 1) s = s//lmsep
      s = s//'['
      do m = 1, size(value, 1)
        if (m > 1) s = s//lvsep
        s = s // to_str(value(m,n))
      enddo
      s = s//']'
    enddo
    s = s//']'

  end function matrix_to_string


end module to_string

program main
  use to_string
  implicit none
  integer :: is = 0
  real    :: rs = 3.14
  logical :: ls = .TRUE.
  character(*), parameter :: cs = 'xx'

  integer :: iv(3) = [1,2,3]
  real    :: rv(3)  = [1.1,2.2,3.3]
  logical :: lv(3)  = [.TRUE.,.FALSE.,.TRUE.]
  character(2), parameter :: cv(3)  = ['xx','yy','zz']

  integer, parameter :: im(2,2) = reshape([1,2,3,4],[2,2])
  real, parameter    :: rm(2,2)  = reshape([1.1,2.2,3.3,4.4],[2,2])
  logical, parameter :: lm(2,2)  = reshape([.TRUE.,.FALSE.,.TRUE.,.FALSE.],[2,2])
  character(2), parameter :: cm(2,2)  = reshape(['xx','yy','zz','oo'],[2,2])

  print*, 'ls = '//to_str(ls)
  print*, 'is = '//to_str(is)
  print*, 'rs = '//to_str(rs)
  print*, 'cs = '//to_str(cs)

  print*, 'lv = '//to_str(lv)
  print*, 'iv = '//to_str(iv)
  print*, 'rv = '//to_str(rv)
  print*, 'cv = '//to_str(cv)

  print*, 'lm = '//to_str(lm)
  print*, 'im = '//to_str(im)
  print*, 'rm = '//to_str(rm)
  print*, 'cm = '//to_str(cm)

end program main
