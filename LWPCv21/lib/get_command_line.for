      SUBROUTINE GET_COMMAND_LINE(LenCMD,CMDLine)

c***********************************************************************
c                         subroutine get_command_line
c***********************************************************************

c  Program Source:  Naval Ocean Systems Center - Code 542

c  Date:
c     04 Dec 1996

c  Function:
c     Returns current command line used to run the program

c  Parameters passed:
c     none

c  Parameters returned:
c     LenCMD           [i] length of the command line
c     cmdline          [s] the command line


c*******************!***************************************************
      integer, intent(out) :: LenCMD
      character(120), intent(out) :: CMDLine
      
      character(80) :: buf
      integer :: i, l, j
      
      lencmd = 0
      j = 1
      
      do i = 0,command_argument_count()
        call get_command_argument(i, buf, l)
        lencmd = lencmd + l
        cmdline(j:j+lencmd) = buf
        j = j+lencmd   
      enddo
      

      END      ! GET_COMMAND_LINE
