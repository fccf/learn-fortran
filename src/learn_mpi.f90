program learn_mpi
  use mpi
  implicit none

  integer :: ip, np, ctx, info
  real :: wtime

  call mpi_init(info)
  call mpi_comm_size(MPI_COMM_WORLD, np, info)
  call mpi_comm_rank(MPI_COMM_WORLD, ip, info)

  if(ip == 0) then
    print*, 'number of process = ',np
    wtime = mpi_wtime()
  endif

  print*, 'hello mpi from process ',ip

  if(ip==0) then
    wtime = mpi_wtime() - wtime
    print*, 'Time elapsed = ',wtime,' seconds.'
  endif

  call mpi_finalize(info)


end program learn_mpi
