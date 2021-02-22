FROM nytimes/blender:latest

RUN ["mkdir", "scripts", "content"]

RUN apt-get install -y unzip wget

WORKDIR scripts

COPY scripts .

RUN ["blender", "-b", "-P", "install-flip-fluids.py"]

# Rclone cache into original project folder in Dropbox
# RUN rclone copy $CACHE_FOLDER "dropbox:/DodaCo Production/Projects/$PROJECT_ID/01 Project Files/Blender/$CACHE_FOLDER"

ENTRYPOINT ["/bin/bash", "download-content.sh"]