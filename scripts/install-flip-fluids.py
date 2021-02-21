import bpy

bpy.ops.preferences.addon_install(overwrite=True, filepath='./flip-fluids.zip')
bpy.ops.preferences.addon_enable(module='flip_fluids_addon')
bpy.ops.wm.save_userpref()
