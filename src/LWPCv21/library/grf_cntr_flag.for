      LOGICAL FUNCTION GRF_CNTR_FLAG
     &                (cells,nrx,set_cell,i,j,edge)

c***********************************************************************

c  Function:
c     Put a one in the array CELLS at the position corresponding to EDGE
c     in the cell at I,J if SET_CELL is TRUE; otherwise, return TRUE or
c     FALSE if the bit is set or not. The array is dimensioned for two
c     contour lines to allow tracing the upper and lower boundaries of
c     the filled area independently.

c  Parameters passed:
c     parameter    [t,n]         description {t is type, n is dimension}
c     cells        [i,*,2]       work array
c     nrx          [i]           number of elements in the data array
c                                along the X axis
c     set_cell     [l]           flag which determines the action to be
c                                taken (see Function above)
c     i            [i]           index of cell along the X axis
c     j            [i]           index of cell along the Y axis
c     edge         [i]           number of the edge of the cell (they
c                                are numbered counterclockwise starting
c                                with 1 at the bottom)

c  Parameters returned:
c     parameter    [t,n]         description {t is type, n is dimension}
c     grf_cntr_flag[l]           =F: if the contour line has not yet
c                                crossed this edge; =T: if the contour
c                                line has already crossed this edge

c  Common blocks referenced:

c  Functions and subroutines referenced:
c     iand
c     ior

c  References:

c  Change History:

c*******************!***************************************************

      IMPLICIT      NONE

      logical       set_cell

      integer       cells(1),
     &              bits_per_word,
     &              bits_to_cell,
     &              bit_position,
     &              edge,
     &              i,
     &              iand,              ! Function
     &              ior,               ! Function
     &              j,
     &              mask(32),
     &              nrx,
     &              result,
     &              words_to_cell

      parameter    (bits_per_word=32)

      data          mask/z80000000,z40000000,z20000000,z10000000,
     &                   z08000000,z04000000,z02000000,z01000000,
     &                   z00800000,z00400000,z00200000,z00100000,
     &                   z00080000,z00040000,z00020000,z00010000,
     &                   z00008000,z00004000,z00002000,z00001000,
     &                   z00000800,z00000400,z00000200,z00000100,
     &                   z00000080,z00000040,z00000020,z00000010,
     &                   z00000008,z00000004,z00000002,z00000001/

c     Number of bits to the specified cell
      bits_to_cell=(i+(j-1)*nrx)*4

c     Number of words to the specified cell
      words_to_cell=bits_to_cell/bits_per_word+1

c     Number of bits from the beginning of the word
c     to the beginning of the cell
      bit_position=bits_to_cell-(words_to_cell-1)*bits_per_word

c     Check if this is a test or setting operation
      if (set_cell) then

c        Set the bit for the specified edge of the cell
         result=IOR (cells(words_to_cell),mask(bit_position+edge))

         cells(words_to_cell)=result

         grf_cntr_flag=.true.
      else

c        Find out if the bit is set
         result=IAND(cells(words_to_cell),mask(bit_position+edge))

         if (result .eq. 0) then
            grf_cntr_flag=.false.
         else
            grf_cntr_flag=.true.
         end if
      end if

      RETURN
      END      ! GRF_CNTR_FLAG
