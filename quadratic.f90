program quadratic
    implicit none

    ! Rewriten to work with real numbers
    real :: a, b, c, xreal
    integer :: x, xp 
    !integer, parameter :: range = 100
    real :: x1, x2, d, y
    character(1), parameter :: newline = achar(10)
    logical :: graph = .false.

    ! A little bit of a menu
    print *, newline // 'Quadratic equation solver' // newline // 'Enter the coefficients of the equation ax^2 + bx + c = 0' // newline

    ! Get the coefficients all at once
    write (*, '(A)', advance='no') 'Enter a, b, c: '
    read (*,*) a, b, c
    
    ! Calculate the discriminant
    d = b**2 - 4*a*c

    ! Calculate the roots
    if (d >= 0.) then
        x1 = (-b + sqrt(d)) / (2*a)
        x2 = (-b - sqrt(d)) / (2*a)
        write (*, '(A, F6.2, A, F6.2, A)', advance='no') 'x1 = ', x1, ', x2 = ', x2, newline
        graph = .true.
    else
        write (*, '(A)', advance='no') 'No real roots', newline
    end if

    ! If there are real roots, write the data to a file
    if (graph .eqv. .true.) then
        open (unit=10, file='quadratic.dat', status='replace')
        do x = -1, 5  ! -range, range
            do xp = 0, 99
                xreal = real(x) + real(xp)/100.                  ! x = x + xp/10.
                y = a*(xreal**2) + b*xreal + c
                write (10, '(2F15.2)') real(xreal),  real(y)
            end do
        end do
        flush (10)
        close (10)
    end if

end program quadratic