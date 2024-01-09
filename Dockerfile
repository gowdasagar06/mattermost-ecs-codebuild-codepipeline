FROM centos:7
ADD https://releases.mattermost.com/6.6.1/mattermost-6.6.1-linux-amd64.tar.gz /
RUN tar -xvzf *.gz
RUN mv /mattermost /opt/
COPY config.json /opt/mattermost/config/config.json
RUN useradd --system --user-group mattermost
RUN chown -R mattermost:mattermost /opt/mattermost
RUN chmod -R g+w /opt/mattermost
USER mattermost:mattermost
VOLUME /opt/mattermost/data
CMD ["/opt/mattermost/bin/mattermost"]
