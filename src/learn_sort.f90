module learn_sort

  implicit none

contains
  recursive subroutine quick_sort(v)
    real, intent(inout) :: v(:)
    integer :: i,j,n
    real :: chosen, temp
    integer, parameter :: max_simple_sort_size = 6

    n = size(v)
    if(n<max_simple_sort_size) then
      call sort_simple2(v)
    else
      chosen = v(n/2)
      i = 0
      j = n+1
      do
        do
          i = i+1
          if(v(i)>=chosen) exit
        enddo
        do
          j = j - 1
          if(v(j)<=chosen) exit
        enddo
        if(i<j) then
          temp = v(i)
          v(i) = v(j)
          v(j) = temp
        elseif(i==j) then
          i=i+1
          exit
        else
          exit
        endif
      enddo
      if(1<j) call quick_sort(v(:j))
      if(i<n) call quick_sort(v(i:))

    endif

  end subroutine quick_sort


  subroutine sort_simple2(v)
    real, intent(inout) :: v(:)
    integer :: min_loc(1), i
    do i  = 1,size(v) - 1
      min_loc = minloc(v(i:))
      call swap(v(i),v(i+min_loc(1)-1))
    enddo
  end subroutine sort_simple2

  subroutine sort_simple(v)
    real, intent(inout) :: v(:)

    integer :: i,j
    do i = 1,size(v) -1
      do j = i+1,size(v)
        if(v(i)>v(j)) call swap(v(i),v(j))
      enddo
    enddo

  end subroutine sort_simple

  subroutine swap(ri,rj)
    real, intent(inout) :: ri,rj
    real :: rt

    rt = ri
    if(rt > rj) then
      ri = rj
      rj = rt
    endif

  end subroutine swap

end module learn_sort

program main
  use learn_sort
  implicit none

  real, allocatable :: rv(:)
  integer :: j

  rv = [(real(j),j=10,1,-1)]

  print*, rv
  call sort_simple(rv)
  print*, rv
  
  rv = [(real(j),j=10,1,-1)]
  call sort_simple2(rv)
  print*, rv

  rv = [(real(j),j=10,1,-1)]
  call quick_sort(rv)
  print*, rv

end program main
