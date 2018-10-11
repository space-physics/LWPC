      SUBROUTINE GET_DATE
     &          (iyear,imonth,iday)

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

      integer       iyear,imonth,iday

c     WATCOM specific code
      integer  *  2 iy,im,id

      call GETDAT (iy,im,id)
      iyear =iy
      imonth=im
      iday  =id
c     WATCOM specific code

c     SUN SOLARIS specific code
c     integer       iarray(3)
c
c     call ITIME (iarray)
c     iyear =iarray(3)
c     imonth=iarray(2)
c     iday  =iarray(1)
c     SUN SOLARIS specific code

      RETURN
      END      ! GET_DATE
