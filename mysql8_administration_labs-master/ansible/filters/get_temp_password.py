import re


class FilterModule(object):
    def filters(self):
        return {'get_temp_password': get_temp_password}


def get_temp_password(cmd_output_lines):
    pw_line_re = r".*A temporary password is generated for root@localhost: (?P<password>.*)"
    pw_line = re.compile(pw_line_re)
    for cmd_output_line in cmd_output_lines:
        matched_line = pw_line.match(cmd_output_line)
        if matched_line:
            return matched_line.groupdict()['password']
    return None
