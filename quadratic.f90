program quadratic
    implicit none

    integer :: a, b, c, x, y
    integer, parameter :: range = 100
    real :: x1, x2, d
    character(1), parameter :: newline = achar(10)
    logical :: graph = .false.

    ! A little bit of a menu
    print *, newline // 'Quadratic equation solver' // newline // 'Enter the coefficients of the equation ax^2 + bx + c = 0' // newline

    ! Get the coefficients
    write (*, '(A)', advance='no') 'Enter a: '
    read (*,*) a
    write (*, '(A)', advance='no') 'Enter b: '
    read (*,*) b
    write (*, '(A)', advance='no') 'Enter c: '
    read (*,*) c

    ! Calculate the discriminant
    d = b**2 - 4*a*c

    ! Calculate the roots
    if (d > 0) then
        x1 = (-b + sqrt(d)) / (2*a)
        x2 = (-b - sqrt(d)) / (2*a)
        write (*, '(A, F6.2, A, F6.2, A)', advance='no') 'x1 = ', x1, ', x2 = ', x2, newline
        graph = .true.
    else if (int(d) == 0) then
        x1 = -b / (2*a)
        write (*, '(A, F6.2)', advance='no') 'x = ', x1, newline
        graph = .true.
    else
        write (*, '(A)', advance='no') 'No real roots', newline
    end if

    ! If there are real roots, write the data to a file
    if (graph .eqv. .true.) then
        open (unit=10, file='quadratic.dat', status='replace')
        do x = -range, range
            y = a*x**2 + b*x + c
            write (10, '(2I6)') x, y
        end do
        flush (10)
        close (10)
    end if

end program quadratic