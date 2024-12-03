#!/usr/bin/env python3
import argparse
import logging
import sys
import signal
import gi
import json
gi.require_version('Playerctl', '2.0')
from gi.repository import GLib

import subprocess
from os import system
from os.path import isfile
from pathlib import Path

logger = logging.getLogger(__name__)


def write_backup_state(backupstate):
    logger.info('Writing output')

    output = {'class': 'custom-' + backupstate,
              'alt': backupstate}

    sys.stdout.write(json.dumps(output) + '\n')
    sys.stdout.flush()


def on_no_backup():
    logger.info('No current backup')
    sys.stdout.write('\n')
    sys.stdout.flush()


def check_backup_state():
    lines = str(subprocess.run(['ps', '-ef', '|', 'grep', 'make-logos-borg-backup', '|', 'wc', '-l']).stdout)
    sys.stdout.write(lines)
    sys.stdout.flush()
    lines = int(lines)
    if lines > 1:
        write_backup_state('backup')
    else:
        on_no_backup()


def signal_handler(sig, frame):
    logger.debug('Received signal to stop, exiting')
    sys.stdout.write('\n')
    sys.stdout.flush()
    sys.exit(0)


def parse_arguments():
    parser = argparse.ArgumentParser()

    # Increase verbosity with every occurrence of -v
    parser.add_argument('-v', '--verbose', action='count', default=0)

    return parser.parse_args()


def main():
    arguments = parse_arguments()

    # Initialize logging
    logging.basicConfig(stream=sys.stderr, level=logging.DEBUG,
                        format='%(name)s %(levelname)s %(message)s')

    # Logging is set by default to WARN and higher.
    # With every occurrence of -v it's lowered by one
    logger.setLevel(max((3 - arguments.verbose) * 10, 0))

    # Log the sent command line arguments
    logger.debug('Arguments received {}'.format(vars(arguments)))

    loop = GLib.MainLoop()
    GLib.timeout_add(500, lambda *_: check_backup_state())

    signal.signal(signal.SIGINT, signal_handler)
    signal.signal(signal.SIGTERM, signal_handler)
    signal.signal(signal.SIGPIPE, signal.SIG_DFL)

    loop.run()


if __name__ == '__main__':
    main()
