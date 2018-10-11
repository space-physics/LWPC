      SUBROUTINE FLUSH_UNIT
     &          (logical_unit)

c***********************************************************************
c                         subroutine flush_unit
c***********************************************************************

c  Program Source:  Naval Ocean Systems Center - Code 542

c  Date:
c     25 April 1993

c  Function:
c     Uses WATCOM routine to flush a logical unit;
c     overriding OS/2's lazy writes during debugging.

c  Parameters passed:
c     logical_unit     [i] number of the logical unit to flush

c  Parameters returned:

c  Common blocks referenced:

c  Functions and subroutines referenced:
c     flushunit
c     lwpc_error

c  Common blocks:

c  References:

c  Change History:

c  Notes:

c*******************!***************************************************

      integer       flushunit


      iStatus=FLUSHUNIT (logical_unit)

      if (iStatus .ne. 0)
     &   call LWPC_ERROR ('Error','FLUSHUNIT returned non-zero code')

      RETURN
      END      ! FLUSH_UNIT
