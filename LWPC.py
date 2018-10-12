#!/usr/bin/env python
from argparse import ArgumentParser
import lwpc


def main():
    p = ArgumentParser()
    p.add_argument('stem', help='output filestem')
    p = p.parse_args()

    lwfhdr = lwpc.lwf_header(p.stem)
    print(lwfhdr)

    lwfdat = lwpc.lwf_read(p.stem)
    print(lwfdat)


if __name__ == '__main__':
    main()
