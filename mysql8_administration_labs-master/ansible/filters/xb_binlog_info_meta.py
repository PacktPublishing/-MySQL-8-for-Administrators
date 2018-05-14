#!/usr/bin/env python2.7


class FilterModule(object):
    def filters(self):
        return {'xb_binlog_info_meta': xb_binlog_info_meta}


def xb_binlog_info_meta(metadata):
    ret_dict = {'filename': metadata[0], "position": metadata[1].strip()}
    if len(metadata) == 3:
        ret_dict['gtid'] = metadata[2].strip()
    return ret_dict
