#!/usr/bin/env python
from pathlib import Path
from typing import Dict, Any
from typing.io import BinaryIO
import struct
import numpy as np
from contextlib import contextmanager


@contextmanager
def opener(fn: Path) -> BinaryIO:
    with fn.open("rb") as f:
        yield f


def lwf_read(fn: Path) -> Dict[str, Any]:
    fn = Path(fn).expanduser().with_suffix(".lwf")

    with opener(fn) as f:
        lwf_header(f)

        f.seek(8, 1)

        dat = _lwf_prelim(f)

        xy = np.empty((dat["nrlwf"], dat["nrcmp"], dat["nrpts"]))
        amp_lwf = np.empty_like(xy)
        phs_lwf = np.empty_like(xy)
        sgmnt = np.empty((dat["nrlwf"], dat["nrcmp"], dat["nrps"], dat["nrsgmnt"]))
        param = np.empty((dat["nrlwf"], dat["nrcmp"], dat["nrprm"]))
        for k in range(xy.shape[0]):
            for i in range(xy.shape[1]):
                if i != 0:
                    dat = _lwf_prelim(f)
                sgmnt[k, i, :, :] = np.fromfile(
                    f, np.float32, dat["nrps"] * dat["nrsgmnt"]
                ).reshape(dat["nrps"], -1)
                param[k, i, :] = np.fromfile(f, np.float32, dat["nrprm"])
                for j in range(dat["nrpts"]):
                    xy[k, i, j] = struct.unpack("f", f.read(4))[0]
                    amp_lwf[k, i, j] = struct.unpack("f", f.read(4))[0]
                    phs_lwf[k, i, j] = struct.unpack("f", f.read(4))[0]

    return dat


def _lwf_prelim(f: BinaryIO) -> Dict[str, Any]:
    dat = {}
    dat["bearng"] = struct.unpack("f", f.read(4))[0]
    dat["rhomx"] = struct.unpack("f", f.read(4))[0]
    dat["rlat"] = struct.unpack("f", f.read(4))[0]
    dat["rlon"] = struct.unpack("f", f.read(4))[0]
    dat["rrho"] = struct.unpack("f", f.read(4))[0]

    dat["nrps"] = struct.unpack("i", f.read(4))[0]
    dat["nrsgmnt"] = struct.unpack("i", f.read(4))[0]
    dat["nrprm"] = struct.unpack("i", f.read(4))[0]
    dat["nrpts"] = struct.unpack("i", f.read(4))[0]
    dat["nrcmp"] = struct.unpack("i", f.read(4))[0]
    dat["nrlwf"] = struct.unpack("i", f.read(4))[0]

    return dat


def lwf_header(f: BinaryIO) -> Dict[str, Any]:
    if isinstance(f, (str, Path)):
        fn = Path(f).expanduser().with_suffix(".lwf")

        with opener(fn) as f:
            return lwf_header(f)

    out = {}
    out["archive"] = f.read(8)
    out["file_id"] = [f.read(120).decode("ascii") for _ in range(3)]
    out["prgm_id"] = f.read(12).decode("ascii")
    out["case_id"] = f.read(80).decode("ascii")
    out["prfl_id"] = f.read(40).decode("ascii")
    out["xmtr_id"] = f.read(20).decode("ascii")

    out["freq"] = struct.unpack("f", f.read(4))[0]
    out["txlat"] = struct.unpack("f", f.read(4))[0]
    out["txlon"] = struct.unpack("f", f.read(4))[0]

    out["path_id"] = f.read(20).decode("ascii")

    out["oplat1"] = struct.unpack("f", f.read(4))[0]
    out["oplon1"] = struct.unpack("f", f.read(4))[0]
    out["oplat2"] = struct.unpack("f", f.read(4))[0]
    out["oplon2"] = struct.unpack("f", f.read(4))[0]

    nrpath = struct.unpack("i", f.read(4))[0]
    out["bearing"] = np.empty(nrpath)
    out["rhomax"] = np.empty(nrpath)
    out["rxlat"] = np.empty(nrpath)
    out["rxlon"] = np.empty(nrpath)
    for i in range(nrpath):
        out["bearing"][i] = struct.unpack("f", f.read(4))[0]
        out["rhomax"][i] = struct.unpack("f", f.read(4))[0]
        out["rxlat"][i] = struct.unpack("f", f.read(4))[0]
        out["rxlon"][i] = struct.unpack("f", f.read(4))[0]

    return out
