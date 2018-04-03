program learn_star_class

  implicit none
  real :: r = 1., rv(4) = [1.,2.,3.,4.], rm(2,2) = reshape([1.,2.,3.,4.],[2,2])
  character(2) :: c = 'a ', cv(4) = ['a ','b ','c ','d '], cm(2,2) = reshape(['a ','b ','c ','d '],[2,2])
  integer :: i = 1, iv(4) = [1,2,3,4], im(2,2) = reshape([1,2,3,4],[2,2])
  logical :: l = .TRUE.,lv(4) = [.TRUE.,.FALSE.,.FALSE.,.TRUE.], lm(2,2) = reshape([.TRUE.,.FALSE.,.FALSE.,.TRUE.],[2,2])

  print*,'r = '//to_string(r)
  print*,'rv = '//to_string(rv)
  print*,'rm = '//to_string(rm)

  print*,'i = '//to_string(i)
  print*,'iv = '//to_string(iv)
  print*,'im = '//to_string(im)

  print*,'c = '//to_string(c)
  print*,'cv = '//to_string(cv)
  print*,'cm = '//to_string(cm)

  print*,'l = '//to_string(l)
  print*,'lv = '//to_string(lv)
  print*,'lm = '//to_string(lm)

contains
  elemental function to_string(v) result(s)
    class(*), intent(in) :: v
    character(len=:), allocatable :: s
    character(32) :: ls
    select type(v)
    type is(integer)
      write(ls,'(i0)') v
      s = trim(adjustl(ls))//' '
    type is(real)
      write(ls,fmt=*) v
      s = trim(adjustl(ls))//' '
    type is(logical)
      if (v) then
        write(ls,'(a)') 'true'
      else
        write(ls,'(a)') 'false'
      end if
      s = trim(adjustl(ls))//' '
    type is(character(*))
      s = trim(adjustl(v))//' '
      class default
      write(ls,'(a)') '***'
      s = trim(adjustl(ls))
    end select
end function to_string


end program learn_star_class
