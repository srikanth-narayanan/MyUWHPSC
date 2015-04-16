
program test2_omp

    use quadrature_omp, only: trapezoid, error_table
    use omp_lib

    implicit none
    real(kind=8) :: a,b,int_true
    integer :: nvals(7), i, k
    
    ! Specify the number of threads to use
	!$ call omp_set_num_threads(2)
    
	k = 1000
    a = 0.d0
    b = 2.d0
    int_true = (b-a) + (b**4 - a**4) / 4. - (1./k) * (cos(k*b) - cos(k*a))

    print 10, int_true
 10 format("true integral: ", es22.14)
    print *, " "  ! blank line

    ! values of n to test:
    do i=1,7
        nvals(i) = 5 * 2**(i-1)
        enddo

    call error_table(f, a, b, nvals, int_true)

contains

    real(kind=8) function f(x)
        implicit none
        real(kind=8), intent(in) :: x 
        integer :: k
        
        k = 1000
        f = 1.d0 + x**3 + sin(k**x)
    end function f

end program test2_omp