      SUBROUTINE GET_RANDOM(seed,ranval)

c***********************************************************************
c                         subroutine get_random
c***********************************************************************

c  Program Source:  Naval Ocean Systems Center - Code 542

c  Date:
c     04 Dec 1996

c  Function:
c     Returns a random number between 0 and 1

c  Parameters passed:
c     seed             [i] the random number seed

c  Parameters returned:
c     ranval           [f] a random number between 0 and 1


c  Common blocks referenced:

c  Functions and subroutines referenced:
c     urand
c     ran

c  References:

c  Change History:

c*******************!***************************************************

      integer, intent(in) :: seed
      real, intent(out) ::   ranval

      call random_number(ranval)

      END      ! GET_RANDOM
