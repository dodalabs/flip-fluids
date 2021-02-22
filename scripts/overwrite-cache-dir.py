import bpy
import sys
import argparse

argv = sys.argv

if "--" not in argv:
    argv = []  # as if no args are passed
else:
    argv = argv[argv.index("--") + 1:]  # get all args after "--"

parser = argparse.ArgumentParser(description='Overwrite cache directory')
parser.add_argument('--path', dest='cache_dir_path', type=str, help='relative path to the cache directory')

args = parser.parse_args(argv)

final_path = args.cache_dir_path
final_path = final_path.replace('./', '//')

# Sets simulation cache to use the one that was fed as an argument
bpy.context.scene.flip_fluid.get_domain_properties().cache.cache_directory = final_path
print(f'Cache directory successfully set as "{final_path}"')

bpy.ops.wm.save_mainfile()