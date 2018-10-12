      SUBROUTINE GET_TIME(ihr,imn,isc)

c***********************************************************************
c                         subroutine get_time
c***********************************************************************

c  Program Source:  Naval Ocean Systems Center - Code 542

c  Date:
c     04 Dec 1996

c  Function:
c     Returns current time

c  Parameters passed:
c     none

c  Parameters returned:
c     ihr              [i] current hour
c     imn              [i] current minute
c     isc              [i] current second

c  Common blocks referenced:

c  Functions and subroutines referenced:
c     gettim
c     itime

c  References:

c  Change History:

c*******************!***************************************************

      integer, intent(out) :: ihr,imn,isc
      
      integer :: hms(8)

      call date_and_time(values=hms)
      
      ihr = hms(5)
      imn = hms(6)
      isc = hms(7)

      END      ! GET_TIME
