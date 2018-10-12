      PROGRAM UNFORMAT_ITSN

c     copies coefficients
c     from   formatted itsn.fmt
c     to   unformatted itsn$d.dat

      dimension grid(1518)


      OPEN (8,file='../data/itsn.fmt',
     &        status='old')
      OPEN (9,file='../data/itsn$d.dat',
     &        status='unknown',form='unformatted')

      do 14 ii=1,12
      read  (8,'(1p5e16.8)') grid
14    write (9)              grid


      END   ! UNFORMAT_ITSN
