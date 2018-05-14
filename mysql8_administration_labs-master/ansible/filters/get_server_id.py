#!/usr/bin/env python2.7


import zlib


class FilterModule(object):
    def filters(self):
        return {'get_server_id': get_server_id}


def get_server_id(fqdn):
    MAXINT32 = 4294967296
    crc_hash = zlib.crc32(fqdn)
    return crc_hash if crc_hash > 0 else crc_hash + MAXINT32
