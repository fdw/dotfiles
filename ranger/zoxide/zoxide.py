import os.path
import subprocess

import ranger.api
import subprocess
from ranger.api.commands import *

HOOK_INIT_OLD = ranger.api.hook_init


def hook_init(fm):
    def update_zoxide(signal):
        subprocess.Popen(["zoxide", "add", signal.new.path])

    fm.signal_bind('cd', update_zoxide)
    HOOK_INIT_OLD(fm)


ranger.api.hook_init = hook_init


class z(Command):
    """:z

    Uses zoxide to set the current directory.
    """

    def execute(self):
        try:
            zoxide = subprocess.run(
                ["zoxide", "query"] + self.args[1:],
                capture_output=True,
                encoding='utf-8'
            )

            if zoxide.returncode == 0:
                output = zoxide.stdout.strip()
                if output:
                    self.fm.notify(output)
                    if os.path.isdir(output):
                        self.fm.enter_dir(output)
                else:
                    self.fm.notify("zoxide: unexpected exit", bad=True)
            else:
                output = zoxide.stderr.strip() or "zoxide: unknown error"
                self.fm.notify(output, bad=True)

        except Exception as e:
            self.fm.notify(e, bad=True)
