program learn_search

  implicit none
  integer, allocatable :: iv(:)

  integer :: j
  integer :: i = 1000
  integer :: n = 100000
  logical :: found

  iv = [(j,j=1,n)]

  call search_seq(iv, i, found)
  print*,'found = ',found
  found = .FALSE.
  found = any(iv == i)
  print*, 'found = ',found
  found = .FALSE.
  call search_bin(iv,i,found)
  print*, 'found = ',found

contains
  subroutine search_seq(iv,i,found)
    integer, intent(in) :: iv(:),i
    logical, intent(out):: found

    integer :: j

    found = .FALSE.
    do j = 1,size(iv)
      if(i == iv(j)) then
        found=.TRUE.
        exit
      endif
    enddo

  end subroutine search_seq

  subroutine search_bin(iv, i, found)
    integer, intent(in) :: iv(:),i
    logical, intent(out):: found

    integer :: first, half, last, only

    first = 1
    last = size(iv)
    do
      if(first == last) exit
      half = (first+last)/2
      if(i<=iv(half)) then
        last = half
      else
        first = half + 1
      endif
    enddo

    only = first
    found = (i == iv(only))

  end subroutine search_bin

end program learn_search
