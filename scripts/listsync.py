import argparse
import os
import sys

parser = argparse.ArgumentParser(
    'listsync',
    description='Maintains a file with a unique list of items'
)
parser.add_argument(
    '-a', '--add',
    help='Items to add to file',
    nargs='+',
)
parser.add_argument(
    '-d', '--delete',
    help='Items to remote from file',
    nargs='+',
)
parser.add_argument(
    '-f', '--file',
    help='Path to the file to sync',
)
args = parser.parse_args()

if not os.path.exists(args.file):
    sys.exit(f'File {args.file} does not exist')

# Open the file and read its lines into a list
with open(args.file, 'r') as file:
    lines = file.readlines()

# Convert the list into a set
items = set(map(str.strip, lines))
if args.add:
    items.update(args.add)
if args.delete:
    items.difference_update(args.delete)

items = sorted(list(items))

# Overwrite the file with the updated set
with open(args.file, 'w') as file:
    file.writelines('\n'.join(items))

[print(item) for item in items]
