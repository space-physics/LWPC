      SUBROUTINE GET_COMMAND_LINE
     &          (LenCMD,CMDLine)

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

c  Common blocks referenced:

c  Functions and subroutines referenced:
c     fgetcmd
c     getarg
c     iargc

c  References:

c  Change History:

c*******************!***************************************************

c     WATCOM specific code
      integer       FGETCMD
      integer       LenCMD
      character*120 CMDLine

c     SUN SOLARIS specific code
c     character *60 argv(2)


c     WATCOM specific code
      LenCMD=FGETCMD (CMDLine)
c     WATCOM specific code

c     SUN SOLARIS specific code
c     n=IARGC ()
c     do i=1,n
c        call GETARG (i,argv)
c     end do
c     CMDLine=argv(1)
c     LenCMD=n
c     SUN SOLARIS specific code

      RETURN
      END      ! GET_COMMAND_LINE
