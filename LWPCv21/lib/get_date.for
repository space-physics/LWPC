      SUBROUTINE GET_DATE(iyear,imonth,iday)

c***********************************************************************
c                         subroutine get_date
c***********************************************************************

c  Program Source:  Naval Ocean Systems Center - Code 542

c  Date:
c     04 Dec 1996

c  Function:
c     Returns current date

c  Parameters passed:
c     none

c  Parameters returned:
c     iyear            [i] current year
c     imonth           [i] current month
c     iday             [i] current day of the month

c  Common blocks referenced:

c  Functions and subroutines referenced:
c     getdat
c     itime

c  References:

c  Change History:

c*******************!***************************************************

      integer, intent(out) :: iyear,imonth,iday
      integer :: ymd(8)

      call date_and_time(values=ymd)
      
      iyear=ymd(1)
      imonth=ymd(2) 
      iday = ymd(3)

      END      ! GET_DATE
