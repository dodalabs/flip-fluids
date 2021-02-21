FROM nytimes/blender:latest

RUN mkdir app

RUN cd /tmp/

RUN blender -b -P install-flip-fluids.py

# Run simulation
RUN blender -b -P run-simulation.py

# Rclone cache into original project folder in Dropbox
# RUN rclone copy $CACHE_FOLDER "dropbox:/DodaCo Production/Projects/$PROJECT_ID/01 Project Files/Blender/$CACHE_FOLDER"

CMD ['bin/bash']