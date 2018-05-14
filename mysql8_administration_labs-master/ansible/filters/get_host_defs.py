#!/usr/bin/env python2.7


import os


SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))


class FilterModule(object):
    def filters(self):
        return {'get_host_defs': get_host_defs}


def get_host_defs(checked_param):
    if not checked_param:
        raise AssertionError("This parameter needs to evaluate to True")
    result = {}
    with open("host_definition.txt") as f:
        host_def_lines = f.readlines()
    for host_def_line in host_def_lines:
        machine_name, ip, box = host_def_line.split()
        result[machine_name] = [ip, box]
    return result
